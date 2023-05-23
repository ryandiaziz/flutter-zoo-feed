import 'package:flutter/material.dart';
import 'package:zoo_feed/common/utils/coloors.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  const CustomPasswordField({super.key, required this.controller});

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _isHiddenPassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 42,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Coloors.gray,
                width: 2,
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon/Lock.png',
                    width: 20,
                    color: Colors.grey.shade500,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: widget.controller,
                      obscureText: _isHiddenPassword,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: _togglePasswordVisibility,
                          child: Icon(
                            _isHiddenPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color:
                                _isHiddenPassword ? Coloors.gray : Colors.grey,
                          ),
                        ),
                        border: InputBorder.none,
                        // isCollapsed: true,
                        hintText: "Password",
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
