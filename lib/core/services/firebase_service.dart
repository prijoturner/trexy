import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

/// Firebase service wrapper for easy access to Firebase services
class FirebaseService {
  // Singleton pattern
  FirebaseService._();
  static final FirebaseService instance = FirebaseService._();

  // Firebase services
  FirebaseAuth get auth => FirebaseAuth.instance;
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  FirebaseStorage get storage => FirebaseStorage.instance;
  FirebaseAnalytics get analytics => FirebaseAnalytics.instance;
  FirebaseMessaging get messaging => FirebaseMessaging.instance;

  /// Initialize Firebase Messaging
  Future<void> initializeMessaging() async {
    // Request permission for iOS
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // Get FCM token
      String? token = await messaging.getToken();
      print('FCM Token: $token');
    }
  }

  /// Get current user
  User? get currentUser => auth.currentUser;

  /// Check if user is authenticated
  bool get isAuthenticated => currentUser != null;

  /// Sign out
  Future<void> signOut() async {
    await auth.signOut();
  }
}
