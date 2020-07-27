import 'package:sparabox/utilities/constants.dart';
import 'package:sparabox/utilities/push_nofitications.dart';
import 'package:sparabox/utilities/rest-client.dart';

class LoginHandler {
  static Future<bool> login(String username, String password) async {
    print("Logging in securely...");
    try {
      await RestClient.loginOAuth(username, password);
      print("Log in successful");
      PushNotificationsManager.submitToken();
      //storage.write(key: 'authToken', value: loginResponse.accessToken);
      //storage.write(key: 'refreshToken', value: loginResponse.refresh_token);
      return true;
    } on Exception catch (e) {
      print("error from server. $e");
      return false;
    }
  }
}
