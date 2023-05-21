import 'package:flutter/material.dart';
import 'package:zoo_feed/features/home/pages/home_page.dart';
import 'package:zoo_feed/features/home/pages/cart_page.dart';
import 'package:zoo_feed/features/home/pages/ticket_page.dart';
import 'package:zoo_feed/features/home/pages/profile_page.dart';
import 'package:zoo_feed/common/widgets/costom_bottom_navigation_bar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    TicketPage(),
    CartPage(),
    ProfilePage(),
  ];

  void _onNavBarIndexChanged(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: bottomnavbar(
            selectedIndex: _selectedIndex,
            onIndexChanged: _onNavBarIndexChanged));
  }
}
