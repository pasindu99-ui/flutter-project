import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> sendDataToServer(String title) async {
  print("Sending dataa to server");

  var url = Uri.http('localhost:6000', '/login');
  var response =
      await http.post(url, body: {'Username': 'doodle', 'Password': 'blue'});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
