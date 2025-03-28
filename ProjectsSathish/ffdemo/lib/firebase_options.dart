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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBbccMy6BR9XDMAzQXfDCR39lpxXVbuKI8',
    appId: '1:480082159729:web:bcb45a548153f0afcc13d0',
    messagingSenderId: '480082159729',
    projectId: 'sathishff-40c81',
    authDomain: 'sathishff-40c81.firebaseapp.com',
    storageBucket: 'sathishff-40c81.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxmQcrlU0SdRjo1cbJZaY1dt8cqXwuDno',
    appId: '1:480082159729:android:ffd79bcf38bfcdcccc13d0',
    messagingSenderId: '480082159729',
    projectId: 'sathishff-40c81',
    storageBucket: 'sathishff-40c81.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGCihRMMh7tjwGzNWuge5iSidiciDmlmY',
    appId: '1:480082159729:ios:f359a12dbcc9e06dcc13d0',
    messagingSenderId: '480082159729',
    projectId: 'sathishff-40c81',
    storageBucket: 'sathishff-40c81.firebasestorage.app',
    iosBundleId: 'com.example.ffdemo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCGCihRMMh7tjwGzNWuge5iSidiciDmlmY',
    appId: '1:480082159729:ios:f359a12dbcc9e06dcc13d0',
    messagingSenderId: '480082159729',
    projectId: 'sathishff-40c81',
    storageBucket: 'sathishff-40c81.firebasestorage.app',
    iosBundleId: 'com.example.ffdemo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBbccMy6BR9XDMAzQXfDCR39lpxXVbuKI8',
    appId: '1:480082159729:web:4b882ead09932fc7cc13d0',
    messagingSenderId: '480082159729',
    projectId: 'sathishff-40c81',
    authDomain: 'sathishff-40c81.firebaseapp.com',
    storageBucket: 'sathishff-40c81.firebasestorage.app',
  );
}
