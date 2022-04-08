import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/database_helper.dart';

class LoginPage extends StatefulWidget {
@override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  

  final formKey = GlobalKey<FormState>();
 // final scaffoldKey = GlobalKey<ScaffoldState>();
  late String _username, _password;
var db = DatabaseHelper();
  

  @override

Widget build(BuildContext context) {

    var loginBtn = RaisedButton(
      onPressed:  _submit ,
      child: Text("Login"),
      color: Color.fromARGB(255, 115, 175, 192),
    );
    
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
                  
                   validator: (val) {
              if (val == null || val.isEmpty) return 'Field is required.';
              return null;
            },
                  onChanged: (val) => _username = val,
                  decoration: const InputDecoration(
                      labelText: 'Enter Username',
                     
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  validator: (val) {
              if (val == null || val.isEmpty) return 'Field is required.';
              return null;
            },
                  onChanged: (val) => _password = val,
                  decoration: InputDecoration(labelText: "Password"),
                ),
              )
            ],
          ),
        ),
      
         Padding(
            padding: const EdgeInsets.all(10.0),
            child: loginBtn),    
  
      ],
    );

    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Welcome", 
              style: TextStyle(
               color: Colors.white
             )),
          backgroundColor: Color.fromARGB(255, 36, 77, 110),
      ),
     // key: scaffoldKey,
      body: Container(
        child: Center(
          child: loginForm,
        ),
      ),
    );
  }
void _showAlertDialog(String message) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



 void _submit()async {
    if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
       var db = DatabaseHelper();
        var a=await db.select(_username,_password);
        if(a.length>0 && _username=='user'){
          Navigator.pop(context);
      Navigator.of(context).pushNamed("/user");
        }
      else   if(a.length>0 && _username=='admin'){
          Navigator.pop(context);
      Navigator.of(context).pushNamed("/admin");
        }
      else{
      _showAlertDialog('Information is not correct!');
      }
      }}
}