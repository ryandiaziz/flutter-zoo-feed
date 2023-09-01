import 'package:flutter/material.dart';

import '../utils/coloors.dart';

class CustomAuthButton extends StatelessWidget {
  final double? buttonWidth;
  final VoidCallback onPressed;
  final String text;
  final bool isOutline;
  final bool? isLoading;

  const CustomAuthButton(
      {Key? key,
      this.buttonWidth,
      required this.onPressed,
      required this.text,
      required this.isOutline,
      this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: buttonWidth ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: isOutline ? Coloors.green : Colors.white,
            backgroundColor: isOutline ? Colors.transparent : Coloors.green,
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
        child: Text(text),
      ),
    );
  }
}
