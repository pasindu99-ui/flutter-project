import 'package:flutter/material.dart';
import 'package:flutter_app/screens/screen1.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Grid-View"),
        backgroundColor: const Color.fromARGB(255, 67, 3, 152),
      ),
      body: const Center(
        child: Text('My Page2'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 67, 3, 152),
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('List view'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: ((context) => Screen1())),
                );
              },
            ),
            ListTile(
              title: const Text('Grid view'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: ((context) => Screen2())),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
