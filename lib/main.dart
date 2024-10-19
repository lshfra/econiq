// import 'package:checker/views/onboarding.dart';
// import 'package:checker/features/homepagebloc/presentation/pages/home_page_bloc.dart';
import 'package:checker/features/homepagebloc/data/datasources/homepage_remote_datasource.dart';
import 'package:checker/features/homepagebloc/data/repositories/home_repository_impl.dart';
import 'package:checker/features/homepagebloc/domain/usecases/get_home_info.dart';
import 'package:checker/features/homepagebloc/presentation/bloc/homepagebloc_bloc.dart';
import 'package:checker/features/homepagebloc/presentation/pages/home_page_bloc.dart';
import 'package:checker/features/qrscanbloc/data/repositories/qr_scan_repository.dart';
import 'package:checker/features/qrscanbloc/presentation/bloc/qrscanbloc_bloc.dart';
import 'package:checker/features/qrscanbloc/presentation/pages/qr_scan_page.dart';
import 'package:checker/features/ticketbloc/presentation/pages/ticket_next.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:checker/features/loginbloc/data/datasources/login_remote_datasource.dart';
import 'package:checker/features/loginbloc/data/repositories/login_repository_impl.dart';
import 'package:checker/features/loginbloc/domain/usecases/login_usecase.dart';
import 'package:checker/features/loginbloc/presentation/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:checker/features/onboardingbloc/presentation/Provider/onborading_provider.dart';
import 'package:checker/features/onboardingbloc/presentation/pages/onboarding_page.dart';

// // hanya manggil material app

// // provide bisa dipanggil di main saja agar pemanggilannya lebih enak..

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
); 
   print("Firebase initialized succesfullt."); 
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
  runApp(
    MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (_) => OnboradingProvider()),

      // bloc for login

      BlocProvider(
        create: (context) => LoginBloc(
          loginUsecase: LoginUsecase(
            repository: LoginRepositoryImpl(
              remoteDatasource: LoginRemoteDatasource(),
          ),
          ),
        ),
      ),
      ],
      child: const  MaterialApp(
        home: OnboardingPage(),
      ),
    ),
  );
}







// void main(List<String> args) async {
//   try {
//    await Firebase.initializeApp(
//      options: DefaultFirebaseOptions.currentPlatform,
//  ); 
//     print("Firebase initialized succesfullt."); 
//    } catch (e) {
//      print("Error initializing Firebase: $e");
//    }
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => HomepageblocBloc(GetHomeInfo(HomeRepositoryImpl(HomeRemoteDatasourceImpl(),
//         ),
//         ),
//         )..add(FetchHomeInfoEvent()),
//         ),
//         BlocProvider(create: (context) => QrscanblocBloc(qrScanRepository: QrScanRepository()),
//         ),
//       ],
//       child: MaterialApp(
//         home: HomePageBloc(),
//         routes: {
//           '/qrscan': (context) => const QrScanPage(),
//           '/ticketnext': (context) => const TicketNext(),
//         },
//       ),
//     );
//   }
// }