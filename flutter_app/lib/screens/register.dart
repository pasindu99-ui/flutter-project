import 'package:flutter/material.dart';
import 'package:flutter_app/screens/login.dart';
import 'package:flutter_app/screens/screen1.dart';
import 'package:flutter_app/services/registerAuth.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  bool validate = false;

  RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("User-Register"),
        backgroundColor: const Color.fromARGB(255, 67, 3, 152),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                  controller: usernameController,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 67, 3, 152))),
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 23),
                      hintText: "Enter User Name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: emailController,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 67, 3, 152))),
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 23),
                      hintText: "Enter your E-mail"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passwordController,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 67, 3, 152))),
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 23),
                      hintText: "Enter Password"),
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
                      RegisterFunc(context, usernameController.text,
                          emailController.text, passwordController.text);
                    },
                    child: const Text("Register"),
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

RegisterFunc(
    BuildContext context, String userName, String email, String password) {
  if (userName.isEmpty) {
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
  } else if (email.isEmpty) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert!!"),
          content: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("E-mail field cannot be empty"),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("OK"),
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
              child: Text("OK"),
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
              Text("Name: $userName"),
              Text("Password: $password"),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("OK"),
              onPressed: () {
                Future<int> foo() async {
                  final response =
                      await RegisterAuth("$userName", "$email", "$password");
                  return response;
                }

                foo().then((value) {
                  if (value == 200) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
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
    ;
  }
}
