import 'package:flutter/material.dart';

import '../../../common/utils/coloors.dart';

class AuthFooter extends StatelessWidget {
  final String text;
  final String title;
  final VoidCallback onTap;
  const AuthFooter({
    super.key,
    required this.text,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: onTap,
            child: Text(
              title,
              style: const TextStyle(
                color: Coloors.green,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
