import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TypeclassPage extends StatefulWidget {
  @override
  State<TypeclassPage> createState() => _TypeclassPageState();
}

class _TypeclassPageState extends State<TypeclassPage> {
  List<dynamic> classTypes = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://192.168.2.4:3000/api/classtypes'));
    if (response.statusCode == 200) {
      setState(() {
        classTypes = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        height: 500.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: classTypes.length,
          itemBuilder: (context, index) {
            final type = classTypes[index];
            return Container(
              margin: EdgeInsets.all(8.0),
              width: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      'http://192.168.2.4:3000/' + type['imageUrl'],
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Text(
                          type['name'],
                          style: TextStyle(
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
            );
          },
        ),
      ),
    );
  }
}
