import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  static Future login({
    required String email,
    required String password,
  }) async {
    var data = {'email': email, 'password': password};
    var uri = Uri.parse("http://192.168.1.6:3000/api/users/login");
    var response = await http.post(uri, body: data);
    if (response.statusCode == 200) {
      final Map<String, dynamic> dataResponse = json.decode(response.body);
      final pref = await SharedPreferences.getInstance();
      pref.setString(
        'access_token',
        dataResponse['access_token'],
      );
    } else {
      final Map<String, dynamic> dataResponse = json.decode(response.body);
      throw Exception(dataResponse['message']);
    }
  }

  static Future register({
    required String name,
    required String age,
    required String email,
    required String password,
  }) async {
    final dataSignUp = {
      'name': name,
      'age': age,
      'email': email,
      'password': password,
      'roleId': '1',
    };
    final url = Uri.parse('http://13.55.144.244:3000/api/users/create');
    final responseSignUp = await http.post(url, body: dataSignUp);

    if (responseSignUp.statusCode == 201) {
      final responseSignIn = await http.post(
        Uri.parse('http://13.55.144.244:3000/api/users/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (responseSignIn.statusCode == 200) {
        final Map<String, dynamic> dataResponse =
            json.decode(responseSignIn.body);
        final pref = await SharedPreferences.getInstance();
        pref.setString('access_token', dataResponse['access_token']);
      } else {
        throw Exception('Failed to login');
      }
    } else {
      throw Exception('Failed to Sign Up');
    }
  }

  static Future logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
  }
}
