import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoo_feed/features/auth/pages/login_page.dart';
import 'package:zoo_feed/features/auth/pages/sign_up_page.dart';
import 'package:zoo_feed/features/home/pages/home_page.dart';
import 'package:zoo_feed/features/home/pages/profile_page.dart';
import 'package:zoo_feed/features/home/pages/ticket_page.dart';
import 'package:zoo_feed/features/home/pages/cart_page.dart';
import 'features/onboarding/pages/onboarding_page.dart';

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
      home: SignUpPage(),
      // home: LoginPage(),
      // home: OnboardingPage(),
      // home: HomePage(),
      routes: {
        ProfilePage.routeName: (ctx) => ProfilePage(),
        TicketPage.routeName: (ctx) => TicketPage(),
        CartPage.routeName: (ctx) => CartPage(),
      },
    );
  }
}
