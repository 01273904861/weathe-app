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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBnwqm0mLTyqKpGUgsM50cjXIN3rpXM_t0',
    appId: '1:442513989937:web:61fb0e94fddde187e85010',
    messagingSenderId: '442513989937',
    projectId: 'weather-5a890',
    authDomain: 'weather-5a890.firebaseapp.com',
    storageBucket: 'weather-5a890.firebasestorage.app',
    measurementId: 'G-9MFVLCYYW5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBzYHOHa22QLrDZx_mWDnkHkIl30wmMjKM',
    appId: '1:442513989937:android:da7e57c2c5408506e85010',
    messagingSenderId: '442513989937',
    projectId: 'weather-5a890',
    storageBucket: 'weather-5a890.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZpTC53ffcx6Y06xlbYQ8rWm8q69QehLY',
    appId: '1:442513989937:ios:26bc7f2ccbd5aa92e85010',
    messagingSenderId: '442513989937',
    projectId: 'weather-5a890',
    storageBucket: 'weather-5a890.firebasestorage.app',
    iosBundleId: 'com.example.weather',
  );
}