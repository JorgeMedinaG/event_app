import 'package:shared_preferences/shared_preferences.dart';


class UserPreferences {

  static final UserPreferences _instancia = new UserPreferences._internal();

  factory UserPreferences() {
    return _instancia;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET and SET of user name
  get username {
    return _prefs.getString('username') ?? '';
  }

  set username( String value ) {
    _prefs.setString('username', value);
  }
  
  // GET and SET of the eventid
  get eventid {
    return _prefs.getString('eventid') ?? '';
  }

  set eventid( String value ) {
    _prefs.setString('eventid', value);
  }

  // GET and SET of the eventid
  get totalguest {
    return _prefs.getString('totalguest') ?? '';
  }

  set totalguest( String value ) {
    _prefs.setString('totalguest', value);
  }

    // GET and SET of the scancode
  get scancode {
    return _prefs.getString('scancode') ?? '';
  }

  set scancode( String value ) {
    _prefs.setString('scancode', value);
  }



}

