import 'package:flutter/material.dart';
import 'package:zoo_feed/features/home/widgets/cart_card.dart';

class CartPage extends StatelessWidget {
  static const String routeName = '/cart';

  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CartCard(
                  name: 'Pisang',
                  price: 35000,
                  image: 'assets/img/empty_cart.png')
            ],
          )),
    );
  }
}
