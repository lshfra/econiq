import 'package:checker/features/loginbloc/presentation/pages/login_page.dart';
import 'package:checker/features/onboardingbloc/presentation/Provider/onborading_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR12R0ga5meeLJNagG3voT7tNRqdi-y15yb8Q&s", 
            height: 100,
            ),
            const SizedBox(height: 40),
            Text(context.watch<OnboradingProvider>().currentOnborading.title,
            style: const TextStyle(fontSize: 18, color: Color(0xFF016236)),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(context.watch<OnboradingProvider>().currentOnborading.description,
            textAlign: TextAlign.center,),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(onPressed: () {

              // jika sudah di halaman terakhir, navigasi ke loginpage
              if (context.read<OnboradingProvider>().isLastPage) {
                Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const LoginPage(),
                ),
                );
              } else {

              context.read<OnboradingProvider>().nextPage();
              }
            }, 
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF016236),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
            child: const Text("Start", style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}