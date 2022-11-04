import 'package:breadfast/Screens/free.dart';
import 'package:breadfast/Screens/help.dart';
import 'package:breadfast/Screens/login.dart';
import 'package:breadfast/Screens/orders.dart';
import 'package:breadfast/Screens/setting.dart';
import 'package:breadfast/Screens/topup.dart';
import 'package:flutter/material.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

List<Map> _morelist = [
  {
    "title": "Orders",
    "icon": Icon(Icons.shopping_bag_outlined),
    "screen": Orders()
  },
  {
    "title": "Top-Up",
    "icon": Icon(Icons.account_balance_wallet_outlined),
    "screen": TopUp()
  },
  {
    "title": "Free Credit",
    "icon": Icon(Icons.wallet_giftcard),
    "screen": FreeCredit()
  },
  {
    "title": "Account Settings",
    "icon": Icon(Icons.settings_outlined),
    "screen": Setting()
  },
  {"title": "Help", "icon": Icon(Icons.help_outline), "screen": Help()},
  {
    "title": "Log out",
    "icon": Icon(Icons.logout),
  },
];

class _MoreState extends State<More> {
  Widget _more(int index, context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black.withOpacity(0.3), width: 0.5),
          top: index == 0
              ? BorderSide(color: Colors.black.withOpacity(0.3), width: 0.5)
              : BorderSide.none,
        ),
      ),
      child: ListTile(
        onTap: () {
          index == 5
              ? Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MyLogin()))
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => _morelist[index]["screen"]));
        },
        leading: _morelist[index]["icon"],
        title: Align(
            alignment: Alignment(-1.15, 0),
            child: Text(_morelist[index]["title"])),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.black.withOpacity(0.3),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: Text(
              "Hello, Mahmoud",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
              child: Text(
                "Your balance (EGP)",
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "0.00",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _morelist.length,
                itemBuilder: (context, index) {
                  return _more(index, context);
                }),
          )
        ],
      ),
    );
  }
}
