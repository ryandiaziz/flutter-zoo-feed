import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoo_feed/pages/home_page.dart';
import 'package:zoo_feed/pages/profile_page.dart';
import 'package:zoo_feed/pages/ticket_page.dart';
import 'package:zoo_feed/pages/cart_page.dart';
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
      home: HomePage(),
      routes: {
        ProfilePage.routeName: (ctx) => ProfilePage(),
        TicketPage.routeName: (ctx) => TicketPage(),
        CartPage.routeName: (ctx) => CartPage(),
      },
    );
  }
}
