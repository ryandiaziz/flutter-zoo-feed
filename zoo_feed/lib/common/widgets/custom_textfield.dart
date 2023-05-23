import 'package:flutter/material.dart';
import 'package:zoo_feed/common/utils/coloors.dart';

class CustomTextField extends StatelessWidget {
  final String image;
  final TextEditingController controller;
  final String hintText;
  final dynamic keyBoardType;
  final bool read;

  const CustomTextField({
    required this.image,
    required this.controller,
    required this.hintText,
    required this.keyBoardType,
    required this.read,
    Key? key,
  }) : super(key: key);

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
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    image,
                    width: 20,
                    color: Colors.grey.shade500,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      readOnly: read,
                      keyboardType: keyBoardType,
                      controller: controller,
                      decoration: InputDecoration.collapsed(
                        hintText: hintText,
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
