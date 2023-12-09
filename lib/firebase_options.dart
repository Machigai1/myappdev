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
    apiKey: 'AIzaSyAe0wweNUqBMkWU0cLHiqCXa42zXflbL9E',
    appId: '1:902426880427:web:bf4c3d517cad71da080aee',
    messagingSenderId: '902426880427',
    projectId: 'moprogapp',
    authDomain: 'moprogapp.firebaseapp.com',
    storageBucket: 'moprogapp.appspot.com',
    measurementId: 'G-TH428RE0ZJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2AuybVan3uR8l5vYp_JbrdJOF84V6LJI',
    appId: '1:902426880427:android:20dcdd828be27219080aee',
    messagingSenderId: '902426880427',
    projectId: 'moprogapp',
    storageBucket: 'moprogapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1fPWXjpC6IBg6fo0AGnpvaHC7AXIhnrk',
    appId: '1:902426880427:ios:2e55ad6f18434c79080aee',
    messagingSenderId: '902426880427',
    projectId: 'moprogapp',
    storageBucket: 'moprogapp.appspot.com',
    iosBundleId: 'com.example.myappdev',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC1fPWXjpC6IBg6fo0AGnpvaHC7AXIhnrk',
    appId: '1:902426880427:ios:236f570ca3e399bc080aee',
    messagingSenderId: '902426880427',
    projectId: 'moprogapp',
    storageBucket: 'moprogapp.appspot.com',
    iosBundleId: 'com.example.myappdev.RunnerTests',
  );
}
