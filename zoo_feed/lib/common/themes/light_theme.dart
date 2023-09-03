import 'package:flutter/material.dart';

import '../utils/coloors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: Coloors.green,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(vertical: 12),
      ),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor: MaterialStateProperty.all<Color>(
        Coloors.green,
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(16),
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
  ),
);
