import 'package:flutter/material.dart';

class TopUp extends StatefulWidget {
  @override
  _TopUpState createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(249, 249, 249, 1),
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 35),
              child: Text(
                "Top-up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Text(
            "Enter top-up Amount (EGP)",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: "00.00",
                hintStyle: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 20),
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text("Amount should be more than EGP 10.00"),
          ),
          Expanded(child: SizedBox()),
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
                      child: Container(
              margin: EdgeInsets.all(20),
              height: 50,
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10)
              
              ),
              child: Center(child: Text("Top-up",style: TextStyle(color: Colors.white,fontSize: 16),)),
            ),
          )
        ],
      ),
    );
  }
}
