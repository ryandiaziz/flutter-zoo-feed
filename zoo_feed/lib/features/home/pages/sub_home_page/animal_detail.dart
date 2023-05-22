import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnimalDetailPage extends StatefulWidget {
  final int animalId;

  const AnimalDetailPage({required this.animalId});

  @override
  _AnimalDetailPageState createState() => _AnimalDetailPageState();
}

class _AnimalDetailPageState extends State<AnimalDetailPage> {
  dynamic animalDetail;

  @override
  void initState() {
    getAnimalDetail();
    super.initState();
  }

  Future<void> getAnimalDetail() async {
    final response = await http.get(Uri.parse(
        'http://192.168.1.7:3000/api/animals/detail/${widget.animalId}'));
    if (response.statusCode == 200) {
      setState(() {
        animalDetail = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to fetch animal detail');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (animalDetail == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Animal Detail'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Animal Detail'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Animal Name: ${animalDetail['resultAF']['name']}',
                style: TextStyle(fontSize: 24.0),
              ),
              Text(
                'Class Type: ${animalDetail['classTypeData'][0]['name']}',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      );
    }
  }
}
