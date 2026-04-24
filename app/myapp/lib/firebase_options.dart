import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

/// Firebase configuration sourced from provided Firebase app config.
class DefaultFirebaseOptions {
  static const String _projectId = 'asthma-risk-personal-mon-38533';
  static const String _apiKey = 'AIzaSyAhQRVsuWgcnMoUtjKVRfg_D2jgBnNcMgI';
  static const String _databaseUrl =
      'https://asthma-risk-personal-mon-38533-default-rtdb.asia-southeast1.firebasedatabase.app';
  static const String _messagingSenderId = '153186686709';
  static const String _webAppId = '1:153186686709:web:4215d5f2a2ff15632357bc';
  static const String _measurementId = 'G-2VBS5E7PG7';
  static const String _authDomain =
      'asthma-risk-personal-mon-38533.firebaseapp.com';
  static const String _storageBucket =
      'asthma-risk-personal-mon-38533.firebasestorage.app';

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
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not configured for desktop platforms.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: _apiKey,
    appId: _webAppId,
    messagingSenderId: _messagingSenderId,
    projectId: _projectId,
    authDomain: _authDomain,
    databaseURL: _databaseUrl,
    storageBucket: _storageBucket,
    measurementId: _measurementId,
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: _apiKey,
    appId: _webAppId,
    messagingSenderId: _messagingSenderId,
    projectId: _projectId,
    databaseURL: _databaseUrl,
    storageBucket: _storageBucket,
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: _apiKey,
    appId: _webAppId,
    messagingSenderId: _messagingSenderId,
    projectId: _projectId,
    databaseURL: _databaseUrl,
    storageBucket: _storageBucket,
    iosBundleId: 'com.example.myapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: _apiKey,
    appId: _webAppId,
    messagingSenderId: _messagingSenderId,
    projectId: _projectId,
    databaseURL: _databaseUrl,
    storageBucket: _storageBucket,
    iosBundleId: 'com.example.myapp',
  );
}
