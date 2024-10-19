import 'package:flutter/material.dart';
import 'package:checker/views/login_petugas.dart';
class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.network("https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/jawapos/2021/12/Logo-Perhutani.png",  height: 100.0,),
            // SizedBox(height: 50),
            Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR12R0ga5meeLJNagG3voT7tNRqdi-y15yb8Q&s",
                height: 100),
             const SizedBox (height: 50.0),
            const Text(
              "Selamat datang di Econique",
              style: TextStyle(
                fontSize: 18,
                color:  Color(0xFF016236),
              ),
            ),
           const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF016236),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                //aksi
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginPetugas()),
                );
              },
              child: const Text(
                "Start",
                style: TextStyle(
                  fontSize: 18,
                  color:  Color(0xFFFFFFFF),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            const Text(
              "versi 1.0.0",
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
