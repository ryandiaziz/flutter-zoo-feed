import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String image;
  final TextEditingController controller;
  final String label;
  final dynamic keyBoardType;

  const AuthTextField({
    required this.image,
    required this.controller,
    required this.label,
    required this.keyBoardType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        autocorrect: false,
        readOnly: false,
        keyboardType: keyBoardType,
        controller: controller,
        decoration: InputDecoration(
          label: Text(label),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              image,
              width: 12,
              color: Colors.grey.shade500,
            ),
          ),
        ),
      ),
    );
  }
}
