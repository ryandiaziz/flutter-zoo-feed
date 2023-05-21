import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoo_feed/features/auth/pages/login_page.dart';
import 'package:zoo_feed/features/auth/pages/sign_up_page.dart';
import 'package:zoo_feed/features/home/pages/page_controller.dart';
import 'package:zoo_feed/features/welcome/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: LoginPage(),
      home: SplashPage(),
      // home: SplashPage(),
      // home: OnboardingPage(),
      // home: MyHomePage(),
      routes: {
        // ProfilePage.routeName: (ctx) => ProfilePage(),
      },
    );
  }
}
