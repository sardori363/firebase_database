// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAUpSzZZh29MGSd0ha7EmFze4F-JyRCPYA',
    appId: '1:350099279470:web:5511d088fffd4661bfa07f',
    messagingSenderId: '350099279470',
    projectId: 'fir-firestore-57c0d',
    authDomain: 'fir-firestore-57c0d.firebaseapp.com',
    storageBucket: 'fir-firestore-57c0d.appspot.com',
    measurementId: 'G-7BQK4436YM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBESbTr1QOunJGcWkslt---2JZsoAUUJSg',
    appId: '1:350099279470:android:023ac587ca13a519bfa07f',
    messagingSenderId: '350099279470',
    projectId: 'fir-firestore-57c0d',
    storageBucket: 'fir-firestore-57c0d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBXChMayd_aNLRrvE5KERLJHlYhRl0JG4',
    appId: '1:350099279470:ios:fe07c926e3d1901bbfa07f',
    messagingSenderId: '350099279470',
    projectId: 'fir-firestore-57c0d',
    storageBucket: 'fir-firestore-57c0d.appspot.com',
    iosBundleId: 'com.example.firestoreNote',
  );
}
