import 'package:checker/features/homepagebloc/presentation/bloc/homepagebloc_bloc.dart';
import 'package:checker/features/qrscanbloc/presentation/pages/qr_scan_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// import 'qr_scan.dart';
// import 'tiket_terusan.dart';

class HomePageBloc extends StatelessWidget {
  const HomePageBloc({super.key});

  @override
  Widget build(BuildContext context) {
    //trigger FetchHomeInfo saat build pertama kali 
    context.read<HomepageblocBloc>().add(FetchHomeInfoEvent());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: const Color(0xFF016236),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // buka drawer
              },
            );
          },
        ),
        title: BlocBuilder<HomepageblocBloc, HomepageblocState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              return Text(
                state.home.title,
                style: const TextStyle(fontSize: 20.0, color: Color(0xFF016236)),
              );
            } else if (state is HomeLoading) {
              return const Text("Loading...");
            } else {
              return const Text("Econique Scan Ticket");
            }
          },
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
             //navigasi 
             Navigator.pushNamed(context, '/ticketnext');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/onboarding');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<HomepageblocBloc, HomepageblocState>(
              builder: (context, state) {
                if (state is HomeLoaded) {
                  return Image.network("https://i0.wp.com/econique.co.id/wp-content/uploads/2024/02/bedrock_perhutani_subholding_id_econique_app.png?fit=240%2C240&ssl=1", width: 150, height: 150);
                } else if (state is HomeLoading) {
                  return const CircularProgressIndicator();
                } else {
                  return const Text("Failed to load logo");
                }
              },
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QrScanPage()));
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
