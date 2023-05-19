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
              border: Border.all(color: Colors.red),
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
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(8)),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  width: 120,
                  height: 120,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                // Product Name & Price
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.red)),
                  child: Column(
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
                ),
                const Expanded(child: SizedBox()),
                // Icon
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.red)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/icon/Delete.png',
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red)),
                        margin: const EdgeInsets.only(left: 20, top: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/icon/Minus.png',
                              width: 20,
                            ),
                            const Text('20'),
                            Image.asset(
                              'assets/icon/Plus.png',
                              height: 20,
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
