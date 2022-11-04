import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  List<Map> _morelist = [
    {
      "title": "Update Personal Information",
    },
    {
      "title": "Manage Address",
    },
    {
      "title": "Update Email Address",
    },
    {
      "title": "Update Password",
    },
    {
      "title": "Saved Cards",
    },
    {
      "title": "Notification & SMS",
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
        title: Text(_morelist[index]["title"],style: TextStyle(fontWeight: FontWeight.bold),),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "Account Settings",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return _accSetting(index, context);
          }),
    );
  }
}
