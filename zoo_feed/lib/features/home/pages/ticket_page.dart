import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoo_feed/common/widgets/costom_bottom_navigation_bar.dart';
import 'package:zoo_feed/common/utils/coloors.dart';

import '../widgets/ticket_card.dart';

class TicketPage extends StatelessWidget {
  static const String routeName = '/ticket';

  const TicketPage({super.key});
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
        bottomNavigationBar: bottomnavbar(data: 1),
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              TicketCard(
                ticketType: 'VIP Ticket',
                price: 20000,
                image: 'assets/img/ticket_vip.png',
              ),
              SizedBox(height: 20),
              TicketCard(
                ticketType: 'Regular Ticket',
                price: 20000,
                image: 'assets/img/ticket_regular.png',
              )
            ],
          ),
        ));
  }
}
