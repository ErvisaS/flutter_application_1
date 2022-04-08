
 import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/database_helper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class userPage extends StatefulWidget {
  const userPage({Key? key}) : super(key: key);

@override
  _userPageState createState() => _userPageState();
}

class _userPageState  extends State<userPage> {

 final formKey = GlobalKey<FormState>();
 // final scaffoldKey = GlobalKey<ScaffoldState>();
  late String _username, _password;
var db = DatabaseHelper();
  final List<String> _locations = ["Basiskele",
    "Cayirova",
    "Darica",
    "Derince",
    "Dilovasi",
    "Gebze",
    "Golcuk",
    "Kandira",
    "Karamursel",
    "Kartepe",
    "Korfez",
    "Izmit"]; 
  late String _dropDownValue='Select';
  
Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(40.7654, 29.9408),
    zoom: 10.5,
  );
    
  @override

Widget build(BuildContext context) {
  // ignore: avoid_print, non_constant_identifier_names
  var ConfirmBtn =  RaisedButton(
    onPressed:  _fonk,
      child: Text("Confirm"),
      color: Color.fromARGB(255, 115, 175, 192),
    );
     var checkBtn =  RaisedButton(
    onPressed: _fonk,
      child: Text("Check the Route"),
      color: Color.fromARGB(255, 115, 175, 192),
    );
    var userForm = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
      
        Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              const Center(  
          child:Text("Select your stop" ,
           style: TextStyle(  
              fontSize: 25,  
              color: Color.fromARGB(255, 11, 68, 114),  
              fontWeight: FontWeight.w400,  
              fontStyle: FontStyle.normal,  
              letterSpacing: 2,  
              wordSpacing: 7,  ))),  
       
              Padding(
                padding: const EdgeInsets.all(15.0),
          
               child: DropdownButton(
           hint: _dropDownValue == null? Text('Dropdown') : Text(_dropDownValue,
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),
            ),
      isExpanded: true,
      iconSize: 30.0,
      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
      items:_locations.map(
        (val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val),); },).toList(),
      onChanged: (val) {
        setState( () {_dropDownValue = val.toString(); },
        );
      },
    ),
              )
      
    
    ], )),
    Padding(padding: const EdgeInsets.all(1.0),
            child: ConfirmBtn ),
     Padding(padding: const EdgeInsets.all(0.0),
            child: checkBtn ),
    Expanded(
       child:  GoogleMap(
       
        initialCameraPosition: _kGooglePlex,
         mapType: MapType.normal,
     onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      )),   
    
        ] );

    return Scaffold(
      
      appBar: AppBar(
        
  title: const Text('User Page', 
        style: TextStyle(
        color: Colors.white
          )),
        backgroundColor: Color.fromARGB(255, 36, 77, 110),
           ),
body:userForm

     // key: scaffoldKey,
     );
}
void _fonk() async{
   Navigator.of(context).pushNamed("/");
}

}