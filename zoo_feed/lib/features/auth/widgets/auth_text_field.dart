import 'package:flutter/material.dart';
import 'package:zoo_feed/common/utils/coloors.dart';

class AuthTextField extends StatelessWidget {
  final String image;
  final TextEditingController controller;
  final String label;
  final dynamic keyBoardType;
  final bool isRead;

  const AuthTextField({
    required this.image,
    required this.controller,
    required this.label,
    required this.keyBoardType,
    required this.isRead,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        autocorrect: false,
        readOnly: isRead,
        keyboardType: keyBoardType,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          label: Text(label),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Coloors.orange,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
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
