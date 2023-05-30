import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:zoo_feed/features/home/pages/sub_home_page/habitats_detail.dart';

class HabitatPage extends StatefulWidget {
  @override
  State<HabitatPage> createState() => _HabitatPageState();
}

class _HabitatPageState extends State<HabitatPage> {
  List<dynamic> habitats = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://54.206.202.155:3000/api/habitats'));
    if (response.statusCode == 200) {
      setState(() {
        habitats = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        height: 500.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: habitats.length,
          itemBuilder: (context, index) {
            final habitat = habitats[index];
            return GestureDetector(
              onTap: () {
                navigateToHabitatDetail(habitat['id']);
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                width: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        'http://54.206.202.155:3000/' + habitat['imageUrl'],
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Text(
                            habitat['name'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void navigateToHabitatDetail(int id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HabitatDetailPage(habitatId: id),
      ),
    );
  }
}
