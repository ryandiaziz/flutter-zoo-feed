import 'package:flutter/material.dart';

class TicketPage extends StatelessWidget {
  static const String routeName = '/ticket';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket'),
      ),
      body: Center(
        child: Text('Ticket Page'),
      ),
    );
  }
}
