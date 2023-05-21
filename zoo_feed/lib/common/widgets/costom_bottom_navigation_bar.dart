import 'package:flutter/material.dart';

class bottomnavbar extends StatefulWidget {
  late int data;
  bottomnavbar({required this.data});
  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(37),
          topRight: Radius.circular(37),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(37),
          topRight: Radius.circular(37),
        ),
        child: Container(
          color: Colors.transparent,
          height: 70,
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Color(0xFF019267),
            ),
            child: BottomNavigationBar(
              selectedItemColor: Color(0xFFFB983E),
              unselectedItemColor: Colors.white,
              currentIndex: widget.data,
              onTap: (index) {
                switch (index) {
                  case 0:
                    Navigator.popAndPushNamed(context, '/home');
                    break;
                  case 1:
                    Navigator.popAndPushNamed(context, '/ticket');
                    break;
                  case 2:
                    Navigator.popAndPushNamed(context, '/cart');
                    break;
                  case 3:
                    Navigator.popAndPushNamed(context, '/profile');
                    break;
                }
              },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.confirmation_number),
                  label: 'Ticket',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
