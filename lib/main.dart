import 'package:breadfast/Screens/splash.dart'; 
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //builder: DevicePreview.appBuilder,
      theme: ThemeData(primaryColor: Color.fromRGBO(168, 0, 128, 1)),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
