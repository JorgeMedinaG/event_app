
import 'dart:async';

import 'package:flutter/material.dart';
//import 'dart:async';

final _redwine = Color.fromRGBO(91, 23, 22, 1);

class SplashScreen extends StatefulWidget {


  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
  Navigator.of(context).pushReplacementNamed('homescreen');
  }

  @override
  void initState() {
  super.initState();
  startTime();
}
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _redwine ,
      body: Center (
        child: Image.asset('assets/splash_image2.jpg'),
        ),
    ); 
  }

}