import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoo_feed/common/utils/coloors.dart';
import 'package:zoo_feed/common/widgets/costom_bottom_navigation_bar.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic> users = {};

  Future<void> fetchUser() async {
    final pref = await SharedPreferences.getInstance();
    final accessToken = pref.getString('access_token');
    final url = Uri.parse('http://192.168.1.7:3000/api/users/account');
    Map<String, String> headers = {
      'access_token': accessToken!,
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      setState(() {
        users = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  void logout() async {
    final pref = await SharedPreferences.getInstance();

    pref.clear();
  }

  @override
  void initState() {
    fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget profileHeader() {
      return SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height / 2,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  'http://192.168.1.7:3000/${users['imageUrl']}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              users['name'],
              style: const TextStyle(
                fontSize: 35,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              users['roleId'] == 1 ? 'Visitor' : 'Zookeeper',
              style: const TextStyle(
                fontSize: 25,
                color: Coloors.gray,
              ),
            )
          ],
        ),
      ));
    }

    Widget profileMenu() {
      return Container(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => logout(),
            )
          ],
        ),
      );
    }

    return Scaffold(
        body: Column(
      children: [
        profileHeader(),
        profileMenu(),
      ],
    ));
  }
}
