import 'package:flutter/material.dart';
import 'package:login_qr_project/src/bloc/provider.dart';
import 'package:login_qr_project/src/providers/user_provider.dart';

//final _redwine = Color(5B1716);
final _redwine = Color.fromRGBO(91, 23, 22, 1);
final _cream = Color.fromRGBO(216, 162, 124, 1);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  final usuario = UserProvider();
  

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric( horizontal: size.width * 0.10, vertical: size.height * 0.13),
        children: <Widget>[
           _welcomeText(size),
           SizedBox(height: size.height * 0.03),
           _createLoginForm(bloc, size),
        ],
      ),
    );
  }

  Widget _welcomeText(Size size) {
    final titleStyle = TextStyle(
    fontSize: size.height * 0.05,
    color: _redwine, 
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w300,
  );
    final subtitleStyle = TextStyle(
    fontSize: 16.0,
    color: _cream,
    fontFamily: "Montserrat", 
    fontWeight: FontWeight.w300,
  );
    return Container(
      width: size.width * 0.45,
      height: size.height * 0.18,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(width: size.width * 0.48, height: size.height * 0.08, child: Text("Welcome", style: titleStyle)),
          SizedBox(height: size.height * 0.03),
          Container(width: size.width * 0.67, height: size.height * 0.03, child: Text("Enter your mobile number to", style: subtitleStyle,)),
          Container(width: size.width * 0.67, height: size.height * 0.03, child: Text("start to hayyacom app", style: subtitleStyle,))

        ],
      ),
    );
  }

  Widget _createLoginForm(LoginBloc bloc, Size size) {
       
    return Column(
      children: <Widget>[
        _mobilenumberfield(bloc),    
        SizedBox(height: 10.0,),
        _passwordfield(bloc),
        SizedBox(height: 20.0,),
        _createLoginButton(bloc),                
      ],
    );
  }
  Widget _mobilenumberfield(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.emailStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          child: TextField(
          style: TextStyle(color: _cream),
          keyboardType: TextInputType.phone ,
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Mobile Number",
            prefixIcon: Icon(Icons.phone_android) ,
            //counterText: snapshot.data,    
            ),
          onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _passwordfield(LoginBloc bloc){

    return StreamBuilder(
      stream: bloc.passwordStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          child: TextField(
          obscureText: true,
          style: TextStyle(color: Colors.deepOrange[300]),
          keyboardType: TextInputType.text,
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(Icons.lock)
          ),
          onChanged: bloc.changePassword,
        ),
        );
      },
    );
  }




  Widget _createLoginButton(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.formValidStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return SizedBox(
      width: double.infinity,
      height: 58.0,
          child: RaisedButton(
            child: Text("Login", style: TextStyle(fontSize: 18.0),),
            color: _redwine,
            textColor: _cream,
            onPressed: snapshot.hasData ? () => _login(bloc, context): null,
            //() => Navigator.of(context).pushReplacementNamed('welcome'),
      ),
    );
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) async {
    print("=====================");
    print("Email: ${ bloc.mobilenumber}");
    print("Password: ${ bloc.password} ");
    print("=====================");

    Map response = await usuario.loginUser(bloc.mobilenumber, bloc.password);
    
    if ( response['ok'] ){
      
      Navigator.of(context).pushReplacementNamed('welcome');
    } else {
      
      _mostrarAlerta( context, response['error'] );
    }

  }

  void _mostrarAlerta(BuildContext context, String text) {

    showDialog(
      context: context,
      builder: ( context ) {
        return AlertDialog(
            title: Text("$text",style: TextStyle(
              fontSize: 22.0), textAlign: TextAlign.center,),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel", style: TextStyle(fontSize: 20.0),),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );

      }
    );
  }

}

