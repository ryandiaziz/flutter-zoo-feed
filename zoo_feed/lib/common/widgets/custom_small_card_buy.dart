import 'package:flutter/material.dart';
import 'package:zoo_feed/common/widgets/custom_modal_card_buy.dart';
import '../../../../common/utils/coloors.dart';

class smallcardbuy extends StatelessWidget {
  final dynamic imageUrl;
  final String destext;
  final double fontsize;
  final int userId;
  final int foodId;
  final dynamic stock;
  final dynamic price;

  const smallcardbuy({
    Key? key,
    required this.userId,
    required this.stock,
    required this.foodId,
    required this.imageUrl,
    required this.destext,
    required this.price,
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
                  builder: (BuildContext context) {
                    return ModalBuyWidget(
                        imageUrl: imageUrl,
                        destext: destext,
                        stock: stock,
                        price: price);
                  },
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
      height: 550,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text(
            '${destext}',
            style: TextStyle(
                fontSize: 24,
                fontFamily: 'inter',
                fontWeight: FontWeight.bold,
                color: Coloors.green),
          ),
          SizedBox(height: 20),
          Container(
            width: 300,
            height: 150,
            decoration: BoxDecoration(
              color: Color(0xFFFB983E),
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage('http://192.168.2.4:3000/' + imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
              padding: EdgeInsets.only(left: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Stocks : ${stock}',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'inter',
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Price : ${price}',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'inter',
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
