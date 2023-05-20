import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/utils/coloors.dart';

class CartCard extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  const CartCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: AspectRatio(
          aspectRatio: 16 / 8,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(2, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                // Product Image
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  width: 120,
                  height: 120,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                // Product Name & Price
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: 'id',
                        symbol: 'Rp ',
                        decimalDigits: 0,
                      ).format(price),
                      style: const TextStyle(
                        color: Coloors.gray,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                // Icon
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/icon/Delete.png',
                        width: 25,
                        color: Colors.red,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20, top: 20),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icon/Minus.png',
                              width: 25,
                            ),
                            const SizedBox(width: 5),
                            const Text('22'),
                            const SizedBox(width: 5),
                            Image.asset(
                              'assets/icon/Plus.png',
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
