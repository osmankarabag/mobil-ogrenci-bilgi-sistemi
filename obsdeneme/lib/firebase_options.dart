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
    apiKey: 'AIzaSyApI5TqsIQc_KMS02o8BzG38RYF3KKWU5E',
    appId: '1:105774787109:web:e60a34b6da8d21b9faedcc',
    messagingSenderId: '105774787109',
    projectId: 'ogrenci-e7362',
    authDomain: 'ogrenci-e7362.firebaseapp.com',
    storageBucket: 'ogrenci-e7362.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPg_tu7_3LguCrNyunHdDdHZKke46eSqQ',
    appId: '1:105774787109:android:85eaf80ad0d875e8faedcc',
    messagingSenderId: '105774787109',
    projectId: 'ogrenci-e7362',
    storageBucket: 'ogrenci-e7362.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZcCUfR5Wm-SuiVFvbutSghjNoy_hwjiw',
    appId: '1:105774787109:ios:7031a59d41977181faedcc',
    messagingSenderId: '105774787109',
    projectId: 'ogrenci-e7362',
    storageBucket: 'ogrenci-e7362.appspot.com',
    iosClientId: '105774787109-7g9l7h46es5cf4ac7eia3ar0c17t5uvv.apps.googleusercontent.com',
    iosBundleId: 'com.example.obs',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZcCUfR5Wm-SuiVFvbutSghjNoy_hwjiw',
    appId: '1:105774787109:ios:7031a59d41977181faedcc',
    messagingSenderId: '105774787109',
    projectId: 'ogrenci-e7362',
    storageBucket: 'ogrenci-e7362.appspot.com',
    iosClientId: '105774787109-7g9l7h46es5cf4ac7eia3ar0c17t5uvv.apps.googleusercontent.com',
    iosBundleId: 'com.example.obs',
  );
}