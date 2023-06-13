import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/register.dart';
import 'package:flutter_app/screens/screen1.dart';
import 'package:flutter_app/services/loginAuth.dart';
import 'package:http/http.dart';

class LoginPage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("User-Login"),
        backgroundColor: const Color.fromARGB(255, 67, 3, 152),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Container(
                  height: 300,
                  child: Center(
                    child: Container(
                        child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(100.0), //add border radius
                      child: Image.asset(
                        "assets/user2.jpg",
                        height: 250.0,
                        width: 250.0,
                        fit: BoxFit.cover,
                      ),
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: nameController,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 67, 3, 152))),
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 23),
                      hintText: "Enter your name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passwordController,
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 67, 3, 152))),
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 23),
                      hintText: "Enter password"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 67, 3, 152)),
                    ),
                    onPressed: () {
                      loginFunc(context, nameController.text,
                          passwordController.text);
                    },
                    child: const Text("Login"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'If you\'re not signed In, please  ',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      TextSpan(
                        text: 'go to Sign Up page',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                      ),
                      TextSpan(text: '.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void loginFunc(BuildContext context, String name, String password) {
  if (name.isEmpty) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert!!"),
          content: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("User Name field cannot be empty"),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  } else if (password.isEmpty) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert!!"),
          content: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Password field cannot be empty"),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert!!"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Name: $name"),
              Text("Password: $password"),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Future<int> foo() async {
                  final response = await loginUser("$name", "$password");
                  return response;
                }

                foo().then((value) {
                  if (value == 200) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Screen1()));
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Alert!!"),
                          content: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Invalid Credentials"),
                            ],
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                });
              },
            ),
          ],
        );
      },
    );
  }
}
