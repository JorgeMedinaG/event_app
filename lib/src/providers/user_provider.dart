import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_qr_project/src/user_preferences/user_preferences.dart';


  

class UserProvider {

  final _prefs = new UserPreferences();

  final _loginurl = 'https://hayyacom.com/QRscannerapp/api/login';
  final _eventurl = 'https://hayyacom.com/QRscannerapp/api/event/';
  final _qrurl    = 'https://hayyacom.com/QRscannerapp/api/checkin-guest/qrscan/';
  final _paperurl = 'https://hayyacom.com/QRscannerapp/api/checkin-guest/paper/';
  final _guesturl = 'https://hayyacom.com/QRscannerapp/api/checkin-guest/totalattendance/';
  final _validurl = 'https://hayyacom.com/QRscannerapp/api/checkin-guest/qrscan-status/';
  final headers = {'Content-Type': 'application/json'};
  final encoding = Encoding.getByName('utf-8');



  Future <Map<String, dynamic>> loginUser (String phonenumber, String password) async {

    final mobileNumber = int.parse(phonenumber);
    final passw = int.parse(password);
    

    final authData = {
      'mobileNumber'       : mobileNumber,
      'password'           : passw,
    };

    
    
    final resp = await http.post(
      _loginurl,
      headers: headers,
      body: json.encode( authData  ),
      encoding: encoding
    );
    
    if (resp.statusCode == 200 ) {
        Map <String, dynamic> decodedResp = json.decode( resp.body );
        if ( decodedResp.containsKey('ErrorMessage')) {
          
          return { 'ok': false, 'error' : decodedResp['ErrorMessage']};
        } else {
          _prefs.username = decodedResp['Rname'];
          _prefs.eventid = decodedResp['Revent'].toString();      
          return { 'ok': true, 'UserName' : decodedResp['Rname'], 'EventID': decodedResp['Revent'] };
        }
    } else if (resp.statusCode == 400) {
          Map <String, dynamic> decodedResp = json.decode( resp.body );
          return { 'ok': false, 'error' : decodedResp['ErrorMessage']};
    
    } else  {
        return { 'ok': false, 'error' : "Server Error"};
    } 
  }

  Future <Map<String, dynamic>> eventDetails () async {

    final _eventid = _prefs.eventid; 
    
    
    final resp2 = await http.get(_eventurl+_eventid);

    Map <String, dynamic> decodedResp2 = json.decode( resp2.body );
    //print(decodedResp['totalguest']);
    
    
    return {'totalguest' : decodedResp2["totalguest"]};
  }

  Future <Map<String, dynamic>> guestTotal () async {

    final _eventid = _prefs.eventid; 
    
    final resp3 = await http.get(_guesturl+"$_eventid");

    
    if(resp3.statusCode == 200) {
        Map <String, dynamic> decodedResp3 = json.decode( resp3.body );
        return decodedResp3;
    } else {
        return {"totalguest": 0};
    }
    
  }

  Future <Map<String, dynamic>> registerCode  (String code, int a) async {

    final _serialcode = int.parse(code);
    final _eventid = _prefs.eventid; 
    final _rqurl = _qrurl+_eventid;

    final data4 = {
      'serialNumber'   : _serialcode, 
      'attending'      : a
    };

    final resp4 = await http.post(
      _rqurl,
      headers: headers,
      body: json.encode( data4 ),
      encoding: encoding
    );

    

    if (resp4.statusCode == 200 ) {

      Map <String, dynamic> decodedResp4 = json.decode( resp4.body );
      return { 'message' : decodedResp4['totalperguest'] };

    }else if ( resp4.statusCode == 400 ) {

      Map <String, dynamic> decodedResp4 = json.decode( resp4.body );
      return {'message' : decodedResp4['ErrorMessage'] };  

    } else  {
        return {'message' : "Server Error"};
    } 
  }

  Future registerPaper (int value) async {

    final _eventid = _prefs.eventid;
    final _requrl = _paperurl+_eventid;
    final data5 = {
      'attendedguest'         : value,
    };

    final resp5 = await http.post(
      _requrl,
      headers: headers,
      body: json.encode( data5  ),
      encoding: encoding
    );

    if(resp5.statusCode == 200) {
        return true;
    } else {
        return false;
    }
    

  } 

  //TODO: Implement method when API is received
  Future <Map<String, dynamic>> validCode (String code)  async {

    final _eventid = _prefs.eventid; 
    
    
    final resp6 = await http.get(_validurl+_eventid+'?serialNumber='+code);

    if (resp6.statusCode == 200) {

      Map <String, dynamic> decodedResp6 = json.decode( resp6.body );
      return {'valid' : true, 'guests': decodedResp6['totalperguest']}; 
    } else if (resp6.statusCode == 400) {
      Map <String, dynamic> decodedResp6 = json.decode( resp6.body );
      return {'valid' : false, 'message': decodedResp6['ErrorMessage']};
    } else {
      return {'valid' : false, 'message': "Server Error"};
    }
  }

  bool isNumeric(String str) {
  try{
    var value = double.parse(str);
  } on FormatException {
    return false;
  } finally {
    return true;
  }
}

}

