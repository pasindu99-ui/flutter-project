import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Home()));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My First Application'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 157, 11, 243),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: Colors.amber,
        child: Text("hello"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 157, 11, 243),
        child: Text("press"),
      ),
    );
  }
}
