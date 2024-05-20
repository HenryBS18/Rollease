import 'package:flutter/material.dart';
import 'package:rollease/views/pages/debitPay.dart';
import 'package:rollease/views/pages/login.dart';
import 'package:rollease/views/pages/onboadring.dart';
import 'package:rollease/views/pages/ovoPay.dart';
import 'package:rollease/views/pages/historyScreen.dart';
import 'package:rollease/views/pages/editScreen.dart';
import 'package:rollease/views/pages/profileScreen.dart';
import 'package:rollease/views/pages/promoScreen.dart';
import 'package:rollease/views/pages/rate.dart';
import 'package:rollease/views/pages/rent.dart';
import 'package:rollease/views/pages/terms.dart';
import 'package:rollease/views/pages/rent.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Roll Esease",
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }
}
