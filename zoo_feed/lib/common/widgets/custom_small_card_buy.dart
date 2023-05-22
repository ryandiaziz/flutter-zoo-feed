import 'package:flutter/material.dart';
import '../../../../common/utils/coloors.dart';

class smallcardbuy extends StatelessWidget {
  final dynamic imageUrl;
  final String destext;
  final double fontsize;
  final int userId;
  final int foodId;

  const smallcardbuy({
    Key? key,
    required this.userId,
    required this.foodId,
    required this.imageUrl,
    required this.destext,
    this.fontsize = 45,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 0,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFFFB983E),
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage('http://192.168.2.4:3000/' + imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 95,
            left: 0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: modalbuybuild,
                );
              },
              child: Container(
                width: 100,
                height: 30,
                child: Icon(
                  Icons.shopping_cart_checkout,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  color: Coloors.green,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(15.0)),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                destext,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFFB983E),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget modalbuybuild(BuildContext context) {
    return Container(
      height: 400,
      color: Colors.white,
      child: Center(
        child: Text(
          'Ini adalah modal',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
