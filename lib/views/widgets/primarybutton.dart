import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color bgColor;
  final Color textColor;
  final double height;
  final double width;
  final double borderRadius;
  final double elevation;

  const PrimaryButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.bgColor,
    required this.textColor,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: bgColor,
        onPrimary: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: elevation,
        fixedSize: Size(width, height),
      ),
      child: Text(text),
    );
  }
}
