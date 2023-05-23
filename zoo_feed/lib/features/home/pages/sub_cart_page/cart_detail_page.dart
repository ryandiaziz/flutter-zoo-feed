import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoo_feed/features/home/widgets/cart_card.dart';

class CartDetailPage extends StatelessWidget {
  const CartDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CartCard(
            name: 'Pisang',
            price: 35000,
            image: 'assets/img/pisang.png',
            qty: 1,
          ),
        ],
      ),
    );
  }
}
