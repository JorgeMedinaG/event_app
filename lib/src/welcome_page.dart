import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_qr_project/src/custom_icons_icons.dart';
import 'package:login_qr_project/src/providers/user_provider.dart';
//import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:barcode_scan/barcode_scan.dart' as scanner;

import 'user_preferences/user_preferences.dart';



class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

final _redwine = Color.fromRGBO(91, 23, 22, 1);
final _cream = Color.fromRGBO(216, 162, 124, 1);
final _boxcolor = Color.fromRGBO(216, 162, 124, 0.1);


class _WelcomePageState extends State<WelcomePage> {

  bool displaybox = false; 
  int _guestcounter;

  final _prefs = new UserPreferences();
  final _user = new UserProvider();
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
   // final height = size.height;
   // final width = size.width;
    final _username = _prefs.username;
    final _eventid = _prefs.eventid;
   // print ("Screen height: $height");
   // print("Screen width: $width");
    _getdetails();

    

    
    
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: SingleChildScrollView(
       child: Container(
        padding: EdgeInsets.symmetric( horizontal: size.width * 0.10, vertical: 25.0), //50.0
          child: Column(
          children: <Widget>[
            _topbutton(context, size),
            // SizedBox(height: 1.0,),//40.0
            _welcomeText(size, _username, _eventid),
            SizedBox(height: 2.5,),//5.0
            _qrbutton(size),
            SizedBox(height: 10.0,),//30.0
            _paperbutton(size),
            SizedBox(height: 10.0,), //30.0
            _selectBox(displaybox, size),
            
          ],
          ),
        ),
      ),
    );
  }

  Widget _topbutton(BuildContext context, Size size) {
    return Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: <Widget>[
               IconButton ( 
                 icon: Icon(CustomIcons.xmlid_2_),
                 iconSize: size.width * 0.06,
                 onPressed: () => _showloggoff(size)
               )
            
             ],
           );

  }

  void _showloggoff(Size size) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return CupertinoAlertDialog(  
            title: Text("Are you sure you want to log out?",style: TextStyle(fontSize: 22.0), textAlign: TextAlign.center,),
            actions: <Widget>[
                  FlatButton(
                  //  elevation: 0.0,
                    textColor: Colors.blue,
                    child: Text("CANCEL", style: TextStyle(fontSize: size.width * 0.04),),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
              //    SizedBox(width: size.width * 0.1 ,),
                  FlatButton(
                  //  elevation: 0.0,
                    textColor: Colors.blue,
                    child: Text("LOGOUT", style: TextStyle(fontSize: size.width * 0.04),),
                    onPressed: () => Navigator.of(context).pushReplacementNamed('homescreen'),
                  )
              
            ],
          );
        }
      );
  }

  Widget _welcomeText(Size size, dynamic user, dynamic event) {

    return Container(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.ltr,
            children: <Widget>[
              Container(height: size.height * 0.06, child: Text("Hello أهلا,", style: TextStyle(fontSize: size.height * 0.04, color: _redwine, fontFamily : "Montserrat" , fontWeight: FontWeight.w300),)),
              SizedBox(height: 3.0,),
              Container(height: size.height * 0.06, child: Text("$user", style: TextStyle(fontSize: size.height * 0.04, color: _cream, fontFamily : "Montserrat", fontWeight: FontWeight.normal ),)),
              SizedBox( height: 5.0,),
              Container(height: size.height * 0.023, child: Row(
                children: <Widget>[
                  Text("Event id رقم الحفلة : ", style: TextStyle(fontSize: size.height * 0.02,color: _redwine, fontFamily : "Montserrat", fontWeight: FontWeight.w300),),
                  Text("$event", style: TextStyle(fontSize: size.height * 0.02,color: _redwine, fontFamily : "Montserrat", fontWeight: FontWeight.bold),),
                ],
              )),    
              SizedBox(height: 35.0,),
              Container(height: size.height * 0.023, child: Text("Select invitation Type اختر نوع الدعوة", style: TextStyle(fontSize: size.height * 0.018, fontWeight: FontWeight.bold, color: _redwine,)))
            ],
          ),
        ],
      ),
    );
  }

  Widget _qrbutton(Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.0625,
          child: RaisedButton(
            child: Text("E-invitation دعوه إلكترونية", style: TextStyle(fontSize: size.height * 0.02, color: Colors.white),),
            color: _redwine,
            onPressed: () =>Navigator.pushNamed(context, 'qrcode')
      ),
    );
  }

  Future _qrreader() async {
    

   //final _receivedstring = await FlutterBarcodeScanner.scanBarcode("#004297", "Cancel", false, ScanMode.QR) ;
  // final _receivedstring = await scanner.BarcodeScanner.scan();
   //print(_receivedstring);
 
    // final _receivedstring = '';
    // print(_receivedstring.length );
    // if (_receivedstring.length > 0 ){
    // showGuestAlert(context, _receivedstring); 
    // print("Tenemos data");
    // } else {
    //   print("No Tenemos data");
    //   Navigator.of(context).pushReplacementNamed('welcome');
    // }

  }


  Widget _paperbutton(Size size) {
        return SizedBox(
          width: double.infinity,
          height: size.height * 0.0625,
          child: RaisedButton(
            child: Text("Paper ورقي", style: TextStyle(fontSize: size.height * 0.02, color: Colors.white),),
            color: _cream,
            onPressed: _paperfunction
            //() => showGuestAlert(context),
      ),
    );
  }

  _paperfunction() {
    setState(() {
      displaybox = true;
    });
  }

  
  _selectBox(bool displaybox, Size size) {
    if (displaybox) {
      return Column( children: <Widget>[_guestcard(size),_selectcard(size)],);
    } else {
      
      return _guestcard(size);
  }

  }

  _getdetails() async {
    Map _count = await _user.guestTotal(); 
   
   setState(() {
     _guestcounter = _count['totalguest'];
   });

  }

  Widget _guestcard(Size size) {
        final _boxsize = size.height * 0.20;
         
        if (_guestcounter == null){
          _guestcounter = 0;
        }
        return Container(
          width: double.infinity,
          height: _boxsize,
          color: _boxcolor,
          child: Column(

            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: _boxsize * 0.15,),
              Container(height: _boxsize * 0.31, child: Text("$_guestcounter", style: TextStyle(fontSize: _boxsize * 0.2, color: _cream, fontFamily : "Montserrat", fontWeight: FontWeight.bold ),)),
              Container(height: _boxsize * 0.14, child: Text("Total Guest Attended", style: TextStyle(fontSize: _boxsize * 0.09, color: _redwine, fontFamily : "Montserrat", fontWeight: FontWeight.bold ),)),
              Container(height: _boxsize * 0.20, child: Text("عدد الضيوف الحاضرين", style: TextStyle(fontSize: _boxsize * 0.09, color: _redwine, fontFamily : "Montserrat", fontWeight: FontWeight.normal ),)),

            ],
            
          ),
        );
  }

  Widget _selectcard(Size size) {

        final _boxsize = size.height * 0.20;
        final _separation = 5.0;
        return Container(
          width: double.infinity,
          height: _boxsize,
          color: _boxcolor,
          child: Column(
            mainAxisSize: MainAxisSize.min,      
            children: <Widget>[
              SizedBox(height: _boxsize * 0.18,),
              Container(height: _boxsize * 0.14, child: Text("Select Number of Guest", style: TextStyle(fontSize: _boxsize * 0.09, color: _redwine, fontFamily : "Montserrat", fontWeight: FontWeight.bold ),)),
              Container(height: _boxsize * 0.25, child: Text("اختر عدد الضيوف الحاضرين", style: TextStyle(fontSize: _boxsize * 0.09, color: _redwine, fontFamily : "Montserrat", fontWeight: FontWeight.normal ),)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                Container(height: _boxsize * 0.22, width: 40.0, child: RaisedButton(color: _cream,textColor: Colors.white , child: Text("1"), onPressed: () => _incrementguest(1),)),
                SizedBox(width: _separation,),
                Container(height: _boxsize * 0.22, width: 40.0, child: RaisedButton(color: _cream,textColor: Colors.white , child: Text("2"), onPressed: () => _incrementguest(2),)),
                SizedBox(width: _separation,),
                Container(height: _boxsize * 0.22, width: 40.0, child: RaisedButton(color: _cream,textColor: Colors.white , child: Text("3"), onPressed: () => _incrementguest(3),)),
                SizedBox(width: _separation,),
                Container(height: _boxsize * 0.22, width: 40.0, child: RaisedButton(color: _cream,textColor: Colors.white , child: Text("4"), onPressed: () => _incrementguest(4),)),
                SizedBox(width: _separation,),
                Container(height: _boxsize * 0.22, width: 40.0, child: RaisedButton(color: _cream,textColor: Colors.white , child: Text("5"), onPressed: () => _incrementguest(5),)),

              ],)

            ],
            
          ),
        );
  }

  _incrementguest (int value) async {
    
      _user.registerPaper(value);
        setState(() { 
      displaybox = false;
    });

  }
  
  //Older alert window
  showGuestAlert  (BuildContext context, String qrcode) {
    final _boxtextsize = 18.0;
    final _boxsize = 40.0;

    Alert(
      style: AlertStyle(
        isOverlayTapDismiss: false,
        isCloseButton: false,

        backgroundColor: Colors.white,
        titleStyle: TextStyle(fontSize: 16.0, color: _redwine, fontFamily : "Montserrat", fontWeight: FontWeight.bold ),
        descStyle: TextStyle(fontSize: 18.0, color: _redwine, fontFamily : "Montserrat", fontWeight: FontWeight.bold ),
        constraints: BoxConstraints(
          minHeight: 268.0,
          minWidth: 320.0, 
          
        )
      ),
      context: context,
      //type: AlertType.warning,
      title: "Status of QR Code",
      desc: "  Select Number of Guest                 ختر عدد الضيوف",
      buttons: [
        DialogButton(

          height: _boxsize,
          width: _boxsize,
          child: Text(
            "1",
            style: TextStyle(color: Colors.white, fontSize: _boxtextsize),
          ),
          onPressed: () => _dialogf(1),
          color: _cream,
        ),
        DialogButton(
          height: _boxsize,
          width: _boxsize,
          child: Text(
            "2",
            style: TextStyle(color: Colors.white, fontSize: _boxtextsize),
          ),
          onPressed: () => _dialogf(2),
          color: _cream,
        ),
        DialogButton(
          
          height: _boxsize,
          width: _boxsize,
          child: Text(
            "3",
            style: TextStyle(color: Colors.white, fontSize: _boxtextsize),
          ),
          onPressed: () => _dialogf(3),
          color: _cream,
        ),
        DialogButton(
          
          height: _boxsize,
          width: _boxsize,
          child: Text(
            "4",
            style: TextStyle(color: Colors.white, fontSize: _boxtextsize),
          ),
          onPressed: () => _dialogf(4),
          color: _cream,
        ),
        DialogButton(
          
          height: _boxsize,
          width: _boxsize,
          child: Text(
            "5",
            style: TextStyle(color: Colors.white, fontSize: _boxtextsize),
          ),
          onPressed: () => _dialogf(5),
          color: _cream,
        ),
      ],
    ).show();
    
    return Future.delayed(Duration());
    
 
  }

  _dialogf(int i){
    _incrementguest(i);
    print("Button Function");    //Navigator.of(context).pop();
    return _qrreader();
  }
}
