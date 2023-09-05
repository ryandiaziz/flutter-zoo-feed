import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class UserRepo {
  static Future<User> getUser() async {
    final pref = await SharedPreferences.getInstance();
    final accessToken = pref.getString('access_token');
    final Map<String, String> headers = {'access_token': accessToken!};
    final url = Uri.parse('http://192.168.1.6:3000/api/users/account');

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      User user = User.fromJson(result);
      await pref.setString('user_data', response.body);
      return user;
    } else {
      throw Exception('Failed to fetch animals');
    }
  }
}
