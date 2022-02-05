// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBobrVg1uRv-I4Js1S9-xiM3Cqd0pRJKXA',
    appId: '1:90468952347:web:2fd5781f20a92159a3cbbe',
    messagingSenderId: '90468952347',
    projectId: 'fudiapp',
    authDomain: 'fudiapp-af82c.firebaseapp.com',
    databaseURL: 'https://fudiapp-default-rtdb.firebaseio.com',
    storageBucket: 'fudiapp.appspot.com',
    measurementId: 'G-Z2XJTSBSTH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3a_ywAOOoac6njl5f5O1uai1rIur4NWk',
    appId: '1:90468952347:android:9cbf20f7857dab55a3cbbe',
    messagingSenderId: '90468952347',
    projectId: 'fudiapp',
    databaseURL: 'https://fudiapp-default-rtdb.firebaseio.com',
    storageBucket: 'fudiapp.appspot.com',
  );
}
