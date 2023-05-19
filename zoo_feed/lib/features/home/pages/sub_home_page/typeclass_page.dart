import 'package:flutter/material.dart';

class TypeclassPage extends StatefulWidget {
  @override
  State<TypeclassPage> createState() => _TypeclassPageState();
}

class _TypeclassPageState extends State<TypeclassPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Class Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
