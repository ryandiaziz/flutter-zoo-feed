import 'package:flutter/material.dart';
import 'package:zoo_feed/features/auth/pages/sign_up_page.dart';

import '../../../common/utils/coloors.dart';

class Footer extends StatelessWidget {
  final String text;
  final String title;
  final VoidCallback onTap;
  const Footer({
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
          Text(text),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: onTap,
            child: Text(
              title,
              style: const TextStyle(
                color: Coloors.green,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
