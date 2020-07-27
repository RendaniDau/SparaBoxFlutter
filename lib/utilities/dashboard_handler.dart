import 'package:sparabox/domain/dashboard_response.dart';
import 'package:sparabox/utilities/constants.dart';
import 'package:sparabox/utilities/rest-client.dart';

class DashboardHandler {
  static Future<DashboardResponse> getDashboard() async {
    print("Getting user dashboard...");
    try {
      String authToken = await storage.read(key: 'authToken');

      final dashboardResponse = await RestClient.getDashboard(authToken);

      return dashboardResponse;
    } on Exception catch (e) {
      print("error from server. $e");
      throw new Exception("Unable to get Dashboard.");
    }
  }
}