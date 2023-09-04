import 'package:flutter/material.dart';

import '../common/widgets/costom_bottom_navigation_bar.dart';
import 'cart/pages/cart_page.dart';
import 'home/pages/home.dart';
import 'home/pages/profile_page.dart';
import 'ticket/ticket_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    TicketPage(),
    const CartPage(),
    const ProfilePage(),
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
        bottomNavigationBar: BottomNavbar(
            selectedIndex: _selectedIndex,
            onIndexChanged: _onNavBarIndexChanged));
  }
}
