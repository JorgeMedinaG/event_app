//import 'package:barcode_scan/barcode_scan.dart' as scanner;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; 
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
//import 'package:barcode_scan/barcode_scan.dart';
//import 'package:flutter/services.dart';
//import 'dart:async';
import 'package:flutter_qr_scanner/qr_scanner_camera.dart';
import 'package:login_qr_project/src/providers/user_provider.dart';

  final _redwine = Color.fromRGBO(70, 11, 11, 27);
  //1final _cream = Color.fromRGBO(216, 156, 88, 85);


class QRPage extends StatefulWidget {

  @override
  _QRPageState createState() => _QRPageState();
}


class _QRPageState extends State<QRPage> {
  String _qrInfo = 'Scan a QR/Bar code';
  bool _camState = false;
  final _user = new UserProvider();

  _qrCallback(String code) async {
    setState(() {
      _camState = false;
      _qrInfo = code;
    });

    print(code);   
    final _validation = await _user.validCode(code) ;
    if (_validation['valid']) {

      _showAlert(code, _validation['guests']);
    } else {
      _resultAlert(_validation['message']);
    }
    
    
  }

  _scanCode() {
    setState(() {
      _camState = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _scanCode();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: _redwine ),
        title: Text("Scan Code", style: TextStyle(fontSize: 28.0, fontFamily : "Montserrat" , fontWeight: FontWeight.w300, color: _redwine),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushReplacementNamed('welcome'),
        ),
      ),
      backgroundColor: Colors.black,
      body: _camState
          ? Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child: QRScannerCamera(
                  fit: BoxFit.cover,
                  onError: (context, error) => Text(
                    error.toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                  qrCodeCallback: (code) {
                    _qrCallback(code);
                  },
                ),
              ),
            )
          : Center(
              child: Text(_qrInfo),
            ),
    );
  }

  _showAlert(String code, String message) {
        showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context){
          return CupertinoAlertDialog(  

            // title: Column(
            //   children: <Widget>[
            //     Text("Status of QR Code",style: TextStyle(fontSize: 18.0, color: _redwine), textAlign: TextAlign.center, ),
            //     Text("$result",style: TextStyle(fontSize: 18.0, color: Colors.black), textAlign: TextAlign.center, ),
            //   ],
            // ),

            content: Column(
              children: <Widget>[
                Text("Code Total Guests: $message", style: TextStyle(fontSize: 18.0, color: _redwine) ),
                Text("Select Number of Guest",style: TextStyle(fontSize: 18.0, color: _redwine) ),
                Text(" اختر عدد الضيوف الحاضرين",style: TextStyle(fontSize: 18.0, color: _redwine), textAlign: TextAlign.center, ),                
              ],
            ),

            actions: <Widget>[
              _selectbuttons(code)
                           
            ],
          );
        }
    );
    
  }

  

  _selectbuttons(String code) {

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
          Container(
          height: 40.0,
          width: 40.0,
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: RaisedButton(
              color: _redwine,
              textColor: Colors.white,
              child: Text("1"),
              onPressed: () => _dialogf(code,1),
            ),
        ),
        SizedBox(width: 5.0,),
        Container(
          height: 40.0,
          width: 40.0,
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: RaisedButton(
              color: _redwine,
              textColor: Colors.white,
              child: Text("2"),
              onPressed: () => _dialogf(code,2),
            ),
        ),
        SizedBox(width: 5.0,),
        Container(
          height: 40.0,
          width: 40.0,
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: RaisedButton(
              color: _redwine,
              textColor: Colors.white,
              child: Text("3"),
              onPressed: () => _dialogf(code,3),
            ),
        ),
        SizedBox(width: 5.0,),
        Container(
          height: 40.0,
          width: 40.0,
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: RaisedButton(
              color: _redwine,
              textColor: Colors.white,
              child: Text("4"),
              onPressed: () => _dialogf(code,4),
            ),
        ),
        SizedBox(width: 5.0,),
        Container(
          height: 40.0,
          width: 40.0,
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: RaisedButton(
              color: _redwine,
              textColor: Colors.white,
              child: Text("5"),
              onPressed: () => _dialogf(code,5),
            ),
        ),
        ]
    ) ;
  }

  _dialogf(String code, int i) async {
    //_incrementguest(i);

  
     final _codestatus = await _user.registerCode(code,i);

    _resultAlert("Successfully Registered");
    //_opencameraagain();
    //Navigator.of(context).pop();
  }

  // Future<String> _opencameraagain(){
  //   return Future.delayed(new Duration(milliseconds: 500 ), (){
  //   setState(() {
  //     _camState = true;
  //   });
  //     return "OK";});
  // }

  _resultAlert(String result) {
        showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return CupertinoAlertDialog(  

            title: Column(
              children: <Widget>[
                Text("Status of QR Code",style: TextStyle(fontSize: 18.0, color: _redwine), textAlign: TextAlign.center, ),
                Text("$result",style: TextStyle(fontSize: 18.0, color: Colors.black), textAlign: TextAlign.center, ),
              ],
            ),

            actions: <Widget>[
              FlatButton(
                  //  elevation: 0.0,
                    textColor: Colors.blue,
                    child: Text("Ok", style: TextStyle(fontSize: 14),),
                    onPressed: _cancelalert,
                  ),
                           
            ],
          );
        }
    );


    
  }
  _cancelalert() {
    //_opencameraagain();
    Navigator.of(context).pushReplacementNamed('qrcode');

  }

}







  //  LAST IMPLEMENTATION, UNCOMMENT COMPLETELY

// class QRPage extends StatefulWidget {

//   @override
//   _QRPageState createState() => _QRPageState();
// }

// class _QRPageState extends State<QRPage> {

//   String _tempvalue, _value = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text("Scan Code"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _qrreader,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   Future _qrreader() async {
//          // final _receivedstring = await FlutterBarcodeScanner.scanBarcode("#004297", "Cancel", false) ;
//      final _receivedstring = await scanner.BarcodeScanner.scan();
    

//   }.
