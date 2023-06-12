import 'dart:convert';
import 'package:http/http.dart' as http;

Future<int> RegisterAuth(String userName, String email, String password) async {
  print("$userName" + "$email" + "$password");
  var url = Uri.http('10.0.2.2:6000', '/create-user');
  var response = await http.post(url,
      body: {'Username': userName, 'Email': email, 'Password': password});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  return json.decode(response.statusCode.toString());
}
