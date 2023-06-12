import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

Future<List<Usermodel>> getUsers() async {
  var url = Uri.http('10.0.2.2:6000', '/view-user');
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  final jsondata = '${response.body}';
  final list = json.decode(jsondata) as List<dynamic>;
  var data = list.map((e) => Usermodel.fromJson(e)).toList();
  return data;
}

class Usermodel {
  String? id;
  String? email;
  String? password;
  String? username;

  Usermodel({this.id, this.email, this.password, this.username});

  Usermodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    username = json['username'];
  }
}
