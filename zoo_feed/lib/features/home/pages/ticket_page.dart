import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoo_feed/common/widgets/costom_bottom_navigation_bar.dart';
import 'package:zoo_feed/common/utils/coloors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../widgets/ticket_card.dart';

class TicketPage extends StatefulWidget {
  static const String routeName = '/ticket';

  TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  List<dynamic>? tickets = [];

  Future getTicket() async {
    final url = Uri.parse("http://192.168.1.6:3000/api/ticket/");
    final response = await http.get(url);
    setState(() {
      tickets = json.decode(response.body);
    });
  }

  @override
  void initState() {
    getTicket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(37),
            bottomRight: Radius.circular(37),
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: Coloors.green,
        title: const Text(
          "Hello, Michael!",
          style: TextStyle(fontSize: 15, fontFamily: "inter"),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
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
          child: ListView.builder(
            itemCount: tickets!.length,
            itemBuilder: (BuildContext context, int index) {
              return TicketCard(
                ticketType: tickets![index]['ticketType']['category'],
                price: tickets![index]['ticketType']['price'],
                image: 'assets/img/ticket_regular.png',
              );
            },
          )),
    );
  }
}
