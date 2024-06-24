import 'dart:convert';

import 'package:rollease/models/user.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://1wxrvfs6-3000.asse.devtunnels.ms";

class AuthService {
  Future<User?> login({required String email, required String password}) async {
    var uri = Uri.parse("$baseUrl/api/user/login?email=$email&password=$password");
    var headers = {'Content-Type': 'application/json'};
    var response = await http.post(uri, headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> rawUser = jsonDecode(response.body);
      final User user = User(
        id: rawUser['data']['id'],
        name: rawUser['data']['name'],
        email: rawUser['data']['email'],
        birthdate: DateTime.parse(rawUser['data']['birthdate']),
        token: rawUser['token'],
      );

      return user;
    }
    return null;
  }

  Future<User?> register({
    required String name,
    required String email,
    required DateTime birthdate,
    required String password,
  }) async {
    var uri = Uri.parse("$baseUrl/api/user/register?name=$name&email=$email&password=$password&birthdate=$birthdate");
    var headers = {'Content-Type': 'application/json'};
    var response = await http.post(uri, headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> rawUser = jsonDecode(response.body);
      final User user = User(
        id: rawUser['data']['id'],
        name: rawUser['data']['name'],
        email: rawUser['data']['email'],
        birthdate: DateTime.parse(rawUser['data']['birthdate']),
        token: rawUser['token'],
      );

      return user;
    }
    return null;
  }
}
