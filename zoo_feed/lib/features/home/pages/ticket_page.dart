import 'package:flutter/material.dart';
import 'package:zoo_feed/common/utils/coloors.dart';

import '../widgets/ticket_card.dart';

class TicketPage extends StatelessWidget {
  static const String routeName = '/ticket';

  const TicketPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Ticket'),
        ),
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
