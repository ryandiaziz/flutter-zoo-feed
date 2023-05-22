import 'package:flutter/material.dart';

class AnimalLikedItem extends StatelessWidget {
  const AnimalLikedItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          margin: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: const DecorationImage(
                image: AssetImage('assets/img/harimau.png'), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 5),
        const Text('Harimau')
      ],
    );
  }
}
