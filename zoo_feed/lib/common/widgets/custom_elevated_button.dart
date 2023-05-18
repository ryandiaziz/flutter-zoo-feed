import 'package:flutter/material.dart';

import '../utils/coloors.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? buttonWidth;
  final VoidCallback onPressed;
  final String text;
  final bool isOutline;

  const CustomElevatedButton(
      {Key? key,
      this.buttonWidth,
      required this.onPressed,
      required this.text,
      required this.isOutline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: buttonWidth ?? MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: isOutline ? Coloors.green : Colors.white,
            backgroundColor: isOutline ? Colors.white : Coloors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: isOutline
                ? const BorderSide(
                    color: Coloors.green,
                    width: 2,
                  )
                : null),
        onPressed: onPressed,
        child: Text(
          text,
        ),
      ),
    );
  }
}
