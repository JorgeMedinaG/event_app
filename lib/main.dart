import 'package:flutter/material.dart';
import 'package:login_qr_project/src/bloc/provider.dart';
import 'package:login_qr_project/src/home_page.dart';
import 'package:login_qr_project/src/qr_reader.dart';
import 'package:login_qr_project/src/splashscreen.dart';
import 'package:login_qr_project/src/user_preferences/user_preferences.dart';
import 'package:login_qr_project/src/welcome_page.dart';
 
void main() async {

  final prefs = new UserPreferences();
  await prefs.initPrefs();

  runApp(MyApp());

}


final _cream = Color.fromRGBO(216, 162, 124, 1);

class MyApp extends StatelessWidget {
  
  

  @override
  Widget build(BuildContext context) {

    
    return Provider (
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primaryColor: _cream
      ),
      home: SplashScreen(),
      routes: {
        'homescreen' : (BuildContext context) => HomePage(), 
        'welcome'    : (BuildContext context) => WelcomePage(),
        'qrcode'     : (BuildContext context) => QRPage()
      },
    ),
    );
  }
}