import 'package:breadfast/Screens/login.dart';
import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  final List<Map> _morelist = [
    {
      "title": "Placing, Modifying, or Cancelling Orders",
    },
    {
      "title": "Breadfast Referrals Program",
    },
    {
      "title": "Other Issues",
    },
  ];
  Widget _accSetting(int index, context) {
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
        onTap: () {},
        title: Text(
          _morelist[index]["title"],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.black.withOpacity(0.3),
        ),
      ),
    );
  }

  Widget _item() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Help",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return _accSetting(index, context);
          }),
    );
  }
}
