import 'package:breadfast/Screens/details.dart';
import 'package:flutter/material.dart';



Widget gridCard(int index, context, String image, String title) {
  return InkWell(
    onTap: (){
      Navigator.push(
            context, MaterialPageRoute(builder: (context) => Details()));
    },
      child: Container(
     
      width: MediaQuery.of(context).size.width / 4,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width / 4 - 20,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(10, 10), //(x,y)
                    blurRadius: 5.0,
                  ),
                ],
                image: DecorationImage(
                    image:NetworkImage(image))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
