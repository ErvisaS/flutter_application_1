// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin.dart';
import 'package:flutter_application_1/loginpage.dart';
import 'package:flutter_application_1/database_helper.dart';
import 'package:flutter_application_1/userpage.dart';
import 'package:flutter_application_1/users.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => userPage(),  
        "/user": (context) => userPage(),
        "/admin": (context) => AdminPage(),
      },
    );
  }
}