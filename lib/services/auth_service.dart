import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikn_code/api/api.dart';
import 'package:vikn_code/models/user_model.dart';

class AuthService {
  final url = "${Api().baseUrl}${Api().login}";

  Future<UserModel?> login(String username, String password) async {
    final Map<String, dynamic> body = {
      'username': username,
      'password': password,
    };
    try {
      var response = await http.post(Uri.parse(url),
          headers: {'content-type': 'application/json'},
          body: jsonEncode(body));
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final UserModel user = UserModel.fromJson(result);

        SharedPreferences _preferences = await SharedPreferences.getInstance();
        _preferences.setString('token', user.data!.access.toString());
        return user;
      } else {
        print("request failed:  ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }
}
