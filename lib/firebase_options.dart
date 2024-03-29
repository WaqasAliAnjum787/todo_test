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
        return macos;
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
    apiKey: 'AIzaSyCRRGXQ1yCYnEsGWGcZAseK0A0Zmvq39Xs',
    appId: '1:976234129877:web:e78866e577a11b0b5d355c',
    messagingSenderId: '976234129877',
    projectId: 'fluttertodo300dollers',
    authDomain: 'fluttertodo300dollers.firebaseapp.com',
    storageBucket: 'fluttertodo300dollers.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvXBUUXVkyQAzN2RA78zbr2qIX3l04B58',
    appId: '1:976234129877:android:12f2e603fd4282125d355c',
    messagingSenderId: '976234129877',
    projectId: 'fluttertodo300dollers',
    storageBucket: 'fluttertodo300dollers.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8owNC6HCFiae6yEl3sd7kHw3Vr5FyoAg',
    appId: '1:976234129877:ios:9dfe535fb65f81e55d355c',
    messagingSenderId: '976234129877',
    projectId: 'fluttertodo300dollers',
    storageBucket: 'fluttertodo300dollers.appspot.com',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8owNC6HCFiae6yEl3sd7kHw3Vr5FyoAg',
    appId: '1:976234129877:ios:8c50008e6e5ebc645d355c',
    messagingSenderId: '976234129877',
    projectId: 'fluttertodo300dollers',
    storageBucket: 'fluttertodo300dollers.appspot.com',
    iosBundleId: 'com.example.todo.RunnerTests',
  );
}
