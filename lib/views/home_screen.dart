import 'package:checker/views/tiket_terusan.dart';
import 'package:flutter/material.dart';
import 'package:checker/views/qr_scan.dart';
import 'package:checker/views/onboarding.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void _logout () {
    Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (context) => const Onboarding()),
      (Route<dynamic> route) => false, 
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: const Color(0xFF016236),
              onPressed: () {
                Scaffold.of(context).openDrawer();  // buka drawer
              },
            );
          },
        ),
        title: const Text(
          "Econique Scan Ticket",
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xFF016236),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
             Container(
                padding: const EdgeInsets.all(16.0),
                color: const Color(0xFF016236),
                alignment: Alignment.bottomLeft,
              child: const Text(
                'Econique Scan Etiket',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.confirmation_num),
              title: const Text('Tiket Terusan'),
              onTap: () {
                // aksi untuk tiket terusan
                Navigator.push( context, MaterialPageRoute(builder: (context) => TiketTerusanPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // aksi untuk logout
                _logout();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/logo.png",
              width: 150,
              height: 150,
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => QrScan()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF016236),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Econique Tiket Scan",
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
