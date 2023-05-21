import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnimalPage extends StatefulWidget {
  @override
  _AnimalPageState createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  List<dynamic> animals = [];

  Future<void> fetchAnimals() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.7:3000/api/animals/'));
    if (response.statusCode == 200) {
      setState(() {
        animals = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to fetch animals');
    }
  }

  @override
  void initState() {
    fetchAnimals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(15.0),
        itemCount: animals.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          final animal = animals[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 30.0,
            shadowColor: Colors.black,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(15.0),
                          bottom: Radius.circular(15.0)),
                      child: Image.network(
                        'http://192.168.1.7:3000/${animal['imageUrl']}',
                        fit: BoxFit.cover,
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              animal['name'],
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              animal['classType']['name'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: const Icon(Icons.favorite_border),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
