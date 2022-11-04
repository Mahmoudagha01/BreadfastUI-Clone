import 'package:animations/animations.dart';
import 'package:breadfast/Screens/Screens.dart';
import 'package:breadfast/Component/customDialog.dart';
import 'package:flutter/material.dart';

class Repeatedorder extends StatefulWidget {
  @override
  _RepeatedorderState createState() => _RepeatedorderState();
}

class _RepeatedorderState extends State<Repeatedorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Repeated Orders",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
              child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://img.freepik.com/free-vector/delivery-concept-illustration_114360-130.jpg?size=626&ext=jpg"),
                ),
              ),
            ),
            Text(
              "You don't have any repeated orders at the",
              style:
                  TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.7)),
            ),
            Text(
              "moment.",
              style:
                  TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.7)),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  showModal(
                    configuration: FadeScaleTransitionConfiguration(),
                    context: context,
                    builder: (context) {
                      return customDialog(context);
                    },
                  );
                },
                child: Text(
                  "How it works?",
                  style: TextStyle(
                      fontSize: 15, color: Theme.of(context).primaryColor),
                )),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Screens(Location: '',),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                width: MediaQuery.of(context).size.width - 20,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).primaryColor),
                child: Center(
                    child: Text(
                  "Create a new order",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
