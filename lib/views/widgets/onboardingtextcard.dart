import 'package:flutter/material.dart';

class OnboardingTextCard extends StatelessWidget {
  final String text;

  const OnboardingTextCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(text),
      ),
    );
  }
}
