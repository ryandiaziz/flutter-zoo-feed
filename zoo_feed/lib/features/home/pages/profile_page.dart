import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoo_feed/common/utils/coloors.dart';
import 'package:zoo_feed/common/widgets/costom_bottom_navigation_bar.dart';
import 'package:http/http.dart' as http;
import 'package:zoo_feed/common/widgets/custom_elevated_button.dart';
import 'package:zoo_feed/features/auth/pages/login_page.dart';
import 'package:zoo_feed/features/home/widgets/profile_menu.dart';
import 'package:zoo_feed/features/user/pages/user_history_page.dart';
import 'package:zoo_feed/features/user/pages/user_liked_page.dart';
import 'package:zoo_feed/features/user/pages/user_ticket_page.dart';

import '../../user/widgets/animal_liked_item.dart';

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
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
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
        height: MediaQuery.of(context).size.height * 1 / 3,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 120,
              height: 120,
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

    Widget logoutMenu() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: SizedBox(
            height: 25,
            width: 25,
            child: Image.asset(
              'assets/icon/sign-out-alt.png',
              color: Colors.grey.shade500,
            ),
          ),
          title: Text(
            'Logout',
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 18,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey.shade500,
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('CONFIRM'),
                    content: const Text('are you sure to logout?'),
                    actions: [
                      CustomElevatedButton(
                        onPressed: logout,
                        text: 'Yes',
                        isOutline: true,
                        buttonWidth: 60,
                      ),
                      CustomElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        text: 'No',
                        isOutline: false,
                        buttonWidth: 60,
                      ),
                    ],
                  );
                });
          },
        ),
      );
    }

    Widget animalLiked() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.only(bottom: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            // header text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Animals Liked',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserLikedPage(),
                      ),
                    );
                  },
                  child: const Text('See all'),
                ),
              ],
            ),
            // content
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // item content
                  AnimalLikedItem(),
                  AnimalLikedItem(),
                  AnimalLikedItem(),
                  AnimalLikedItem(),
                  AnimalLikedItem(),
                  AnimalLikedItem(),
                  AnimalLikedItem(),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          profileHeader(),
          animalLiked(),
          // profile menu
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileMenu(
                  title: 'Your ticket',
                  icon: 'assets/icon/ticket.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserTicketPage(),
                      ),
                    );
                  },
                ),
                ProfileMenu(
                  title: 'History',
                  icon: 'assets/icon/time-past.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserHistoryPage(),
                      ),
                    );
                  },
                ),
                logoutMenu(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
