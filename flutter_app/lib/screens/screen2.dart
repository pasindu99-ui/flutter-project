import 'package:flutter/material.dart';
import 'package:flutter_app/screens/screen1.dart';
import 'package:flutter_app/services/GetUsers.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  List<Usermodel>? userData;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    userData = await getUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Grid-View"),
        backgroundColor: const Color.fromARGB(255, 67, 3, 152),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 4 / 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30),
          padding: const EdgeInsets.all(20),
          itemCount: userData?.length ?? 0,
          itemBuilder: (BuildContext ctx, index) {
            final user = userData![index];
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: InkWell(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 67, 3, 152)
                            .withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(user.username ?? '',
                      style: const TextStyle(
                          fontFamily: 'lobster',
                          fontSize: 20,
                          fontWeight: FontWeight.w100)),
                ),
              ),
            );
          }),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 67, 3, 152),
                  image: DecorationImage(
                      image: AssetImage('assets/user2.jpg'),
                      fit: BoxFit.cover)),
              child: Text('Crud Application'),
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
                  MaterialPageRoute(builder: ((context) => const Screen2())),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
