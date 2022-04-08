import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/database_helper.dart';
import 'package:flutter_application_1/users.dart';

class AdminPage extends StatefulWidget {
@override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
 
  

  final formKey = GlobalKey<FormState>();
 // final scaffoldKey = GlobalKey<ScaffoldState>();
  late String _username, _password;
var db = DatabaseHelper();
  

  @override

Widget build(BuildContext context) {

    var loginForm = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
      
        Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: (val) => _username = val,
                  decoration: InputDecoration(labelText: "Username"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: (val) => _password = val,
                  decoration: InputDecoration(labelText: "Password"),
                ),
              )
            ],
          ),
        ),
       // Row(children: [saveBtn,loginBtn],)
         Padding(
            padding: const EdgeInsets.all(10.0),
            ),    
  
      ],
    );

    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Admin Page" , style: TextStyle(
        color: Colors.white
          )),
             backgroundColor: Color.fromARGB(255, 36, 77, 110),
      ),
     // key: scaffoldKey,
      body: Container(
        
      ),
    );
  }


}