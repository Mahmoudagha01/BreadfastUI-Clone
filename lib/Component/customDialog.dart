import 'package:flutter/material.dart';

Widget customDialog(context) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 100,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                Icons.clear,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Text(
            "HOW IT WORKS",
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
          Text(
            "Repeat Order",
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Image(
                    image: NetworkImage(
                        "https://img.freepik.com/free-vector/delivery-concept-illustration_114360-130.jpg?size=626&ext=jpg"),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          "①",
                          style: TextStyle(
                              fontSize: 30,
                              color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Text(
                            "Choose your favourite product.",
                            style: TextStyle(
                                fontSize: 17,
                                color: Theme.of(context).primaryColor),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          "②",
                          style: TextStyle(
                              fontSize: 30,
                              color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Text(
                            "Select your prefered delivery days.",
                            style: TextStyle(
                                fontSize: 19,
                                color: Theme.of(context).primaryColor),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          "③",
                          style: TextStyle(
                              fontSize: 30,
                              color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Text(
                            "Choose your favourite product.",
                            style: TextStyle(
                                fontSize: 19,
                                color: Theme.of(context).primaryColor),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: Text(
                          "You can skip or cancel your orders any time, no commitment! we'll send you a reminder before each delivery.",
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  color: Theme.of(context).primaryColor),
              child: Center(
                  child: Text(
                "Ok, got it!",
                style: TextStyle(color: Colors.white, fontSize: 15),
              )),
            ),
          ),
        ],
      ),
    ),
  );
}
