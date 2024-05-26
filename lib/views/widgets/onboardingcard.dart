import 'package:flutter/material.dart';

class OnBoardingCard extends StatelessWidget {
  final String text;

  const OnBoardingCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(text),
      ),
    );
  }
}
