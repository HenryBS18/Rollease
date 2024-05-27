import 'package:flutter/material.dart';
import 'package:rollease/views/pages/onboadring.dart';
import 'package:rollease/views/pages/splash_rent.dart';
import 'package:rollease/views/pages/sign_up.dart';
import 'package:rollease/views/pages/rent.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rollease",
      debugShowCheckedModeBanner: false,
      home:SplashRent(),
    );
  }
}
