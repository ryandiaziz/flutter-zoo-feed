import 'package:flutter/material.dart';

class HabitatPage extends StatefulWidget {
  @override
  State<HabitatPage> createState() => _HabitatPageState();
}

class _HabitatPageState extends State<HabitatPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Habitat Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
