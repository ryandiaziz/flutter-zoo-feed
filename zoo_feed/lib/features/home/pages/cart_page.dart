import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoo_feed/common/widgets/costom_bottom_navigation_bar.dart';

class CartPage extends StatelessWidget {
  static const String routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(37),
            bottomRight: Radius.circular(37),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: Color(0xFF019267),
        title: Text(
          "Hello, Michael!",
          style: TextStyle(fontSize: 15, fontFamily: "inter"),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Cart Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: bottomnavbar(data: 2),
    );
  }
}
