import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoo_feed/common/widgets/costom_small_button_circle.dart';
import 'package:zoo_feed/common/utils/coloors.dart';

class CartCard extends StatefulWidget {
  final String image;
  final String name;
  final int price;
  final int qty;
  final int cartId;
  final bool isTicket;
  final bool isVip;
  final bool isChecked;
  final ValueChanged<bool> onCheckboxChanged;

  CartCard({
    required this.image,
    required this.name,
    required this.price,
    required this.qty,
    required this.cartId,
    this.isTicket = false,
    this.isVip = false,
    required this.isChecked,
    required this.onCheckboxChanged,
  });

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Checkbox(
              value: widget.isChecked,
              onChanged: (bool? value) {
                if (value != null) {
                  setState(() {
                    widget.onCheckboxChanged(value);
                  });
                }
              },
              activeColor: Coloors.orange,
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return Coloors.orange;
                }
                return null;
              }),
            ),
            SizedBox(width: 16.0),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: widget.isTicket
                      ? AssetImage(widget.isVip
                              ? 'assets/img/ticket_vip.png'
                              : 'assets/img/ticket_regular.png')
                          as ImageProvider<Object>
                      : NetworkImage('http://192.168.1.6:3000/' + widget.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Rp ',
                      decimalDigits: 0,
                    ).format(widget.price),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.0),
            Row(
              children: [
                CustomSmallButtonCircle(iconData: Icons.remove),
                SizedBox(width: 15),
                Text(
                  widget.qty.toString(),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 15),
                CustomSmallButtonCircle(iconData: Icons.add),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
