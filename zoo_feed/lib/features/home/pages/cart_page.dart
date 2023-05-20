import 'package:flutter/material.dart';
import 'package:zoo_feed/features/home/widgets/cart_card.dart';
import 'package:flutter/services.dart';
import 'package:zoo_feed/common/widgets/costom_bottom_navigation_bar.dart';

import '../../../common/utils/coloors.dart';

class CartPage extends StatelessWidget {
  static const String routeName = '/cart';

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(37),
            bottomRight: Radius.circular(37),
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: Coloors.green,
        title: const Text(
          "Hello, Michael!",
          style: TextStyle(fontSize: 15, fontFamily: "inter"),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomnavbar(data: 2),
      body: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CartCard(
                  name: 'Pisang', price: 35000, image: 'assets/img/pisang.png')
            ],
          )),
    );
  }
}
