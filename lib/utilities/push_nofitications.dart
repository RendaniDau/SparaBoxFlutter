import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sparabox/utilities/rest-client.dart';

class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance =
      PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool _initialized = false;
  String token;

  Future<void> init() async {
    if (!_initialized) {
      // For iOS request permission first.
      _firebaseMessaging.requestNotificationPermissions();
      _firebaseMessaging.configure();

      // For testing purposes print the Firebase Messaging token
      token = await _firebaseMessaging.getToken();
      print("FirebaseMessaging token: $token");

      _initialized = true;
    }
  }

  static Future<void> submitToken() async {
    if (PushNotificationsManager._instance._initialized) {
      print("Sending Notification token to server.");
      RestClient.linkMessageToken(PushNotificationsManager._instance.token);
    }
  }
}
