// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDDHjU80Rj-ThMz7Ow9_E1mCCxW-fZFrLE',
    appId: '1:856955952187:android:6e9780a3d256d254bed01e',
    messagingSenderId: '856955952187',
    projectId: 'checker-dfbdd',
    storageBucket: 'checker-dfbdd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCN5ECcRTTIcO8P9UCaNYwjCICHQZmahIo',
    appId: '1:856955952187:ios:d8ab17c8f08cf2aebed01e',
    messagingSenderId: '856955952187',
    projectId: 'checker-dfbdd',
    storageBucket: 'checker-dfbdd.appspot.com',
    iosBundleId: 'com.example.checker',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDMu-IGZwzR4iNc49GLxY1-SL2yM59de4g',
    appId: '1:856955952187:web:399f2b9f0f43c201bed01e',
    messagingSenderId: '856955952187',
    projectId: 'checker-dfbdd',
    authDomain: 'checker-dfbdd.firebaseapp.com',
    storageBucket: 'checker-dfbdd.appspot.com',
  );

}