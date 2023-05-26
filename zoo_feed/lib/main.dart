import 'package:flutter/material.dart';
import 'package:zoo_feed/features/auth/pages/login_page.dart';
import 'package:zoo_feed/features/auth/pages/sign_up_page.dart';
import 'package:zoo_feed/features/welcome/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoo Feed',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home: LoginPage(),
      // home: SearchPage(),
      home: SplashPage(),
      // home: OnboardingPage(),
      // home: MyHomePage(),
      routes: {
        // ProfilePage.routeName: (ctx) => ProfilePage(),
      },
    );
  }
}
