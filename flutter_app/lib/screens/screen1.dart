import 'package:flutter/material.dart';
import 'package:flutter_app/screens/screen2.dart';
import 'package:flutter_app/services/GetUsers.dart';

class Screen1 extends StatefulWidget {
  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List<Usermodel>? userData;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    userData = await getUsers();
    setState(() {
      loading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("List-View"),
        backgroundColor: const Color.fromARGB(255, 67, 3, 152),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: userData?.length ?? 0,
              itemBuilder: (context, index) {
                if (userData == null) {
                  return const CircularProgressIndicator();
                } else {
                  final user = userData![index];

                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child:
                                  Container(child: Text(user.username ?? '')),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add your button logic here
                                    },
                                    child: Text('Edit'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add your button logic here
                                    },
                                    child: Text('Delete'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 67, 3, 152),
                  image: DecorationImage(
                      image: AssetImage('assets/bg1.jpg'), fit: BoxFit.cover)),
              child: Text('Crud Application',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
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
