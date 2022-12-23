import 'package:breadfast/Screens/Screens.dart';
import 'package:breadfast/Screens/placeprovider.dart';
import 'package:breadfast/Screens/sugestion.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

import '../Component/adresssearch.dart';


class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  GoogleMapController mapController;
  double _CurrentLat;
  double _CurrentLong;
  String country;
  String government;
    Position myCurrentPosition;
  String city;
  String street;
  var _target;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  void getMarkers(double lat, double long) {
    MarkerId markerId = MarkerId(lat.toString() + long.toString());
    Marker _marker = Marker(
      markerId: markerId,
      draggable: true,
      onDragEnd: (endposition) {},
      position: LatLng(lat, long),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
    );
    setState(() {
      markers = {};
      markers[markerId] = _marker;
    });
  }
  PlaceApiProvider placeApiProvider = PlaceApiProvider();
  LatLng defaultLondonCoordinates = const LatLng(51.5072, 0.1276);
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  _getCurrentLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);
    print(position.longitude);
    setState(() {
      _CurrentLat = position.latitude;
      _CurrentLong = position.longitude;
      _target =
          CameraPosition(target: LatLng(_CurrentLat, _CurrentLong), zoom: 16);
    });
  }

  _getAddressfromlatlong(double lat, double long) async {
    List placemark = await Geolocator().placemarkFromCoordinates(lat, long);

    country = placemark[0].country;
    government = placemark[0].administrativeArea;
    city = placemark[0].locality;
    street = placemark[0].name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      resizeToAvoidBottomInset: false,
     
      body: _target == null
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Color.fromRGBO(168, 0, 128, 1),
              ),
            )
          : Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: GoogleMap(
                    initialCameraPosition: _target,
                    onMapCreated: (GoogleMapController googleMapController) {
                      setState(() {
                        mapController = googleMapController;
                      });
                    },
                    markers: Set<Marker>.of(markers.values),
                    onTap: (tapped) {
                      _getAddressfromlatlong(tapped.latitude, tapped.longitude);
                      getMarkers(tapped.latitude, tapped.longitude);
                      setState(
                        () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            country == null
                                ? Container()
                                : SnackBar(
                                    content: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 90),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Thr selected area is : $street, $city, $government, $country",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                    backgroundColor: Colors.transparent,
                                    duration:
                                        const Duration(milliseconds: 1500),
                                  ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Select Delivery Location",
                          style: TextStyle(
                              fontSize: 29,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Playfair Display",
                              fontStyle: FontStyle.italic,
                              color: Color.fromRGBO(168, 0, 128, 1)),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 10,
                  right: 10,
                  top: MediaQuery.of(context).size.height * 0.17,
                  child:  Center(
                              child: TextField(
                                controller: textEditingController,
                                readOnly: true,
                                onTap: () async {
                                  PlaceApiProvider.sessionToken =
                                      const Uuid().v4();
                                  final Suggestion result = await showSearch(
                                    context: context,
                                    delegate: AddressSearch(),
                                  );

                                  if (result != null) {
                                    LatLng latLng = await placeApiProvider
                                        .getPlaceDetailFromId(context,
                                            placeId: result.placeId);
                                    if (latLng != null) {
                                      myCurrentPosition = Position(
                                          longitude: latLng.longitude,
                                          latitude: latLng.latitude,
                                          timestamp: null,
                                          accuracy: 0.0,
                                          altitude: 0.0,
                                          heading: 0.0,
                                          speed: 0.0,
                                          speedAccuracy: 0.0);
                                      mapController.animateCamera(
                                        CameraUpdate.newCameraPosition(
                                          CameraPosition(
                                            target: latLng,
                                            zoom: 15,
                                          ),
                                        ),
                                      );
                                      setState(() {});
                                    }
                                    textEditingController.text =
                                        result.description;
                                  }
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent)),
                                  hintText: 'Search for area, building name...',
                                  hintStyle: const TextStyle(
                                    color: Color(0xFF535353),
                                  ),
                                  suffixIcon: const SizedBox(),
                                ),
                              ),
                            ),
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  right: 40,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Screens(
                                    Location: government,
                                  )));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 100,
                      height: 65,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          "CONFIRM LOCATION",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
