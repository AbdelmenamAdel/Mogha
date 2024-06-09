import 'package:flutter/material.dart';

class RepeatedListTailInDrawer extends StatelessWidget {
  const RepeatedListTailInDrawer({
    super.key,
    required this.title,
    this.icon,
    this.onTap,
  });
  final String title;
  final IconData? icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'Dosis',
          letterSpacing: 1,
        ),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.black12,
        child: Icon(icon, color: Colors.white),
      ),
      trailing: Icon(
        Icons.arrow_right,
        color: Colors.white,
      ),
    );
  }
}
