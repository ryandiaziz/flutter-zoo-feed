import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  const ProfileMenu({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: SizedBox(
          height: 22,
          width: 22,
          child: Image.asset(
            icon,
            color: Colors.grey.shade500,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 18,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey.shade500,
        ),
        onTap: onTap,
      ),
    );
  }
}
