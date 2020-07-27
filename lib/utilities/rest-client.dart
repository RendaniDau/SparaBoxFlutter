import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:sparabox/domain/dashboard_response.dart';
import 'package:sparabox/domain/login_response.dart';
import 'package:sparabox/utilities/constants.dart';

class RestClient {
  static var client;

  static Future<LoginResponse> login(String username, String password) async {
    Map<String, String> requestMap = {
      "client_id": "myclient",
      "grant_type": "password",
      "username": username,
      "password": password
    };

    final http.Response response = await http
        .post(LoginUrl,
            body: requestMap,
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
            encoding: Encoding.getByName("utf-8"))
        .timeout(Duration(seconds: 10));
    //print(response.statusCode);
    //print(response.body);
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Unable to Login.");
    }
  }

  static Future loginOAuth(
      String username, String password) async {
    final authorizationEndpoint = Uri.parse(LoginUrl);

    client = await oauth2.resourceOwnerPasswordGrant(
        authorizationEndpoint, username, password,
        identifier: "myclient", secret: "");

    //new File("~/.myapp/credentials.json")
    //    .writeAsString(client.credentials.toJson());
  }

  static Future<String> refreshAccessToken(String refreshToken) async {
    Map<String, String> requestMap = {
      "client_id": "myclient",
      "grant_type": "password",
      "refresh_token": refreshToken
    };

    final http.Response response = await http
        .post(LoginUrl,
            body: requestMap,
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
            encoding: Encoding.getByName("utf-8"))
        .timeout(Duration(seconds: 10));
    //print(response.statusCode);
    //print(response.body);
    if (response.statusCode == 200) {
      var loginResponse = LoginResponse.fromJson(json.decode(response.body));
      return loginResponse.accessToken;
    } else {
      throw Exception("Unable to refresh access token.");
    }
  }

  static Future<DashboardResponse> getDashboard(String authToken) async {

    final http.Response response = await client.get(
      DashboardUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return DashboardResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Unable to get Dsahboard.");
    }
  }

  static Future linkMessageToken(String messageToken) async {
    Map<String, String> requestMap = {
      "messageToken": messageToken,
    };

    await client..post(LinkMessageTokenUrl,
        body: requestMap,
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName("utf-8"))
        .timeout(Duration(seconds: 10));
  }
}
