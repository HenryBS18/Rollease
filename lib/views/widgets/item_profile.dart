import 'package:flutter/material.dart';

  Widget itemProfile(String title, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.green.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      border: Border.all(color: Color(0xFFA2C90C) )
      ),
      child: ListTile(
        title: Text(title),
        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }

