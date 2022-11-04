import 'package:animations/animations.dart';
import 'package:breadfast/Screens/CartScreen.dart';
import 'package:breadfast/Screens/HomeScreen.dart';
import 'package:breadfast/Screens/MoreScreen.dart';
import 'package:breadfast/Screens/Repeatedorder.dart';
import 'package:breadfast/Screens/free.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Screens extends StatefulWidget {
  String Location;
  Screens({this.Location});
  @override
  _ScreensState createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  List _Screens = [HomeScreen(), Repeatedorder(), Cart(), More()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0
          ? AppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/logo.png"))),
                ),
              ),
              centerTitle: true,
              title: Column(
                children: [
                  Text(
                    "Delivering to",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.normal),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.Location == null
                            ? "Address not defined"
                            : widget.Location,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  )
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FreeCredit()));
                      },
                      child: Container(
                          child: Image(image: AssetImage("images/gift.png")))),
                )
              ],
            )
          : null,
      //Tabs animation
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
          return FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: _Screens[_currentIndex],
          );
        },
        child: _Screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          unselectedFontSize: 10,
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.flip_camera_android_outlined),
                label: "Repeated Orders"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "More"),
          ]),
    );
  }
}
