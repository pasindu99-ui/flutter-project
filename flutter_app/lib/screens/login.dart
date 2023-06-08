import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            child: Container(
              height: 500,
              child: Center(
                child: Container(
                    child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(100.0), //add border radius
                  child: Image.asset(
                    "assets/user1.png",
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                )),
              ),
            ),
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintStyle: TextStyle(color: Colors.white, fontSize: 23),
                hintText: "Enter your name"),
          ),
          TextField(
            obscureText: true,
            obscuringCharacter: "*",
            decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white, fontSize: 23),
                hintText: "Enter your password"),
          )
        ],
      ),
    );
  }
}
