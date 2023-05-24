import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zoo_feed/common/widgets/costom_loading_screen.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoo_feed/features/cart/widgets/payment_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    super.key,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late List<dynamic> order;
  bool isLoading = true;

  Future<void> getOrder() async {
    final url = Uri.parse('http://192.168.2.4:3000/api/payment/user');
    final pref = await SharedPreferences.getInstance();
    final accessToken = pref.getString('access_token');
    Map<String, String> headers = {'access_token': accessToken!};
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      setState(() {
        order = json.decode(response.body);
        isLoading = false;
      });
    } else {
      throw Exception('Failed to fetch order');
    }
  }

  @override
  void initState() {
    getOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return LoadingScreen();
    } else {
      final filteredOrder =
          order.where((item) => item['status'] == false).toList();
      if (filteredOrder.isEmpty) {
        return const Scaffold(
          body: Center(
            child: Text('No Items to payment'),
          ),
        );
      } else {
        return Scaffold(body: OrderList(orderList: filteredOrder));
      }
    }
  }
}
