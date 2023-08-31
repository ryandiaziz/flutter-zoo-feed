import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  Future<void> login(email, password) async {
    try {
      final data = {'email': email, 'password': password};
      final response = await http
          .post(Uri.parse('http://localhost:3000/api/users/login'), body: data);
      if (response.statusCode == 200) {
        final Map<String, dynamic> dataResponse = json.decode(response.body);

        final pref = await SharedPreferences.getInstance();
        pref.setString(
          'access_token',
          dataResponse['access_token'],
        );
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {}
  }
}
