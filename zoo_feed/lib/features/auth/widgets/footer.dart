import 'package:flutter/material.dart';

import '../../../common/utils/coloors.dart';

class Footer extends StatelessWidget {
  final String text;
  final String title;
  const Footer({
    super.key,
    required this.text,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          Text(text),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              color: Coloors.green,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
