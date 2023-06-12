import 'dart:convert';
import 'package:http/http.dart' as http;

Future<int> loginUser(String userName, String password) async {
  print("$userName" + "" + "$password");
  var url = Uri.http('10.0.2.2:6000', '/login');
  var response =
      await http.post(url, body: {'Username': userName, 'Password': password});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  return json.decode(response.statusCode.toString());
}
