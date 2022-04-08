import 'package:flutter/cupertino.dart';

class User {
final  int id;
final  String username;
final String password;

 

  const User({
    required this.id,
    required this.username,
    required this.password,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      
      'username': username,
      'password': password,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'user{id: $id, name: $username, age: $password}';
  }
}