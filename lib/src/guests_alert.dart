import 'package:flutter/material.dart';
import 'package:login_qr_project/src/home_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


  //final _redwine = Color.fromRGBO(70, 11, 11, 27);
  final _cream = Color.fromRGBO(216, 162, 124, 100);
  final _boxtextsize = 18.0;
  final _boxsize = 48.0;

  void showGuestAlert(BuildContext context) {

    Alert(
      style: AlertStyle(
        backgroundColor: Colors.white,
        
        constraints: BoxConstraints(
          maxHeight: 268.0,
          maxWidth: 320.0, 
          
        )
      ),
      context: context,
      //type: AlertType.warning,
      title: "Status of QR Code",
      desc: "Select Number of Guest",
      buttons: [
        DialogButton(

          height: _boxsize,
          width: _boxsize,
          child: Text(
            "1",
            style: TextStyle(color: Colors.white, fontSize: _boxtextsize),
          ),
          onPressed: () => Navigator.pop(context),
          color: _cream,
        ),
        DialogButton(
          height: _boxsize,
          width: _boxsize,
          child: Text(
            "2",
            style: TextStyle(color: Colors.white, fontSize: _boxtextsize),
          ),
          onPressed: () => Navigator.pop(context),
          color: _cream,
        ),
        DialogButton(
          
          height: _boxsize,
          width: _boxsize,
          child: Text(
            "3",
            style: TextStyle(color: Colors.white, fontSize: _boxtextsize),
          ),
          onPressed: () => Navigator.pop(context),
          color: _cream,
        ),
        DialogButton(
          
          height: _boxsize,
          width: _boxsize,
          child: Text(
            "4",
            style: TextStyle(color: Colors.white, fontSize: _boxtextsize),
          ),
          onPressed: () => Navigator.pop(context),
          color: _cream,
        ),
        DialogButton(
          
          height: _boxsize,
          width: _boxsize,
          child: Text(
            "5",
            style: TextStyle(color: Colors.white, fontSize: _boxtextsize),
          ),
          onPressed: () => Navigator.pop(context),
          color: _cream,
        ),
      ],
    ).show();
    
 
  }
  final page = new HomePage();
  buttonaction() {
  
  }

  

  // final columna = Column ( 
  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //   children: <Widget>[
      


      

  //   ],
  // );

  //   List <Widget> _listaItems(List<dynamic> data , BuildContext context) {

  //   final List<Widget> opciones = []; 

  //   data.forEach( (opt) {
  //   final widgetTemp = ListTile(
  //     title: Text(opt['texto']),
  //     leading: getIcon(opt['icon']),
  //     trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
  //     onTap: () {

  //       Navigator.pushNamed(context, opt['ruta']);
  //       // final route = MaterialPageRoute(
  //       //   builder: ( context ) => AlertPage()
          
  //       // );
  //       // Navigator.push(context, route);
  //     },
  //   );

  //     opciones.add(widgetTemp);
  //     opciones.add(Divider());

  //   });


  //   return opciones;
  // }






    //  showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context){
    //       return AlertDialog(
    //         // title: Text("Status of QR Code"),
    //         // titleTextStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: _redwine ),
    //         title: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: <Widget>[
    //                 Text("Status of QR Code", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: _redwine ),),
    //                 Text("Select Number of Guest"),
    //                 Text("اختر عدد الضيوف"),

    //               ],),
    //         content: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                   children: <Widget>[
    //                       SizedBox( width: _mboxsize, height: _mboxsize, child: RaisedButton(child: Text("1"), onPressed: () {}, )),
    //                       SizedBox( width: _mboxsize, height: _mboxsize, child: RaisedButton(child: Text("1"), onPressed: () {}, )),
    //                       SizedBox( width: _mboxsize, height: _mboxsize, child: RaisedButton(child: Text("1"), onPressed: () {}, )),
    //                       SizedBox( width: _mboxsize, height: _mboxsize, child: RaisedButton(child: Text("1"), onPressed: () {}, )),
    //                       SizedBox( width: _mboxsize, height: _mboxsize, child: RaisedButton(child: Text("1"), onPressed: () {}, )),
    //             ],
    //           ),

    //       );
    //     }
    //   );

