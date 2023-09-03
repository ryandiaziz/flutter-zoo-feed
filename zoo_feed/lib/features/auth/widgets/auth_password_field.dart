import 'package:flutter/material.dart';
import 'package:zoo_feed/common/utils/coloors.dart';

class AuthPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String icon;
  const AuthPasswordField(
      {super.key, required this.controller, required this.icon});

  @override
  State<AuthPasswordField> createState() => _AuthPasswordFieldState();
}

class _AuthPasswordFieldState extends State<AuthPasswordField> {
  bool _isHiddenPassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isHiddenPassword,
      decoration: InputDecoration(
        label: const Text("Password"),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            widget.icon,
            width: 12,
            color: Colors.grey.shade500,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: _togglePasswordVisibility,
          child: Icon(
            _isHiddenPassword ? Icons.visibility_off : Icons.visibility,
            color: _isHiddenPassword ? Coloors.gray : Colors.grey,
          ),
        ),
      ),
    );
  }
}
