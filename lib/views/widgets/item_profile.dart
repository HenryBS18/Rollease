import 'package:flutter/material.dart';

class ItemProfile extends StatelessWidget {
  final String title;
  final IconData icon;

  const ItemProfile({Key? key, required this.title, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Colors.green.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
          border: Border.all(color: const Color(0xFFA2C90C))),
      child: ListTile(
        title: Text(title),
        leading: Icon(icon),
        tileColor: Colors.white,
      ),
    );
  }
}
