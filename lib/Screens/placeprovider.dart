import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:breadfast/Screens/sugestion.dart';
class PlaceApiProvider {
  static String sessionToken = '';
  static const apiKey = 'AIzaSyCGA0CAQ2Z_LvRGT34jxE1Ob3wZJ-BcGUc';

  Future<List<Suggestion>> fetchSuggestions(BuildContext context, {String query,}) async {

      try {
        http.Response response = await http.get(Uri.parse('https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&sessiontoken=$sessionToken&types=establishment&language=ar|en&key=$apiKey'),);

        if (response.statusCode == 200) {
          Map<String, dynamic> result = json.decode(response.body);
          final String status = result['status'] is String ? result['status'] : '';

          if (status == 'OK') {
            return result['predictions'].map<Suggestion>((prediction) => Suggestion(prediction['place_id'], prediction['description'])).toList();
          }

          if (result['status'] == 'ZERO_RESULTS') {
            return [];
          }
        }
      } on Exception {}
   
  }

  Future<LatLng> getPlaceDetailFromId(BuildContext context, { String placeId}) async {
    
      try {
        final response = await http.get(Uri.parse('https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=geometry&key=$apiKey&sessiontoken=$sessionToken'),);

       

        if (response.statusCode == 200) {
          final result = json.decode(response.body);
          final String status =
          result['status'] is String ? result['status'] : '';
          if (status == 'OK') {
            Map<String, dynamic> geometry =
            result['result']['geometry']['location'] is Map<String, dynamic>
                ? result['result']['geometry']['location']
                : {};

            if (geometry.isNotEmpty) {
             LatLng latLng = LatLng(geometry['lat'], geometry['lng']);
              return latLng;
            }
          }
        }
      } on Exception {}
  
  }
}