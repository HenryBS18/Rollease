import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  final double width;
  final double height;
  final String leftDescription;
  final String rightDescription;
  final Color toggleColor;
  final Color toggleBackgroundColor;
  final Color toggleBorderColor;
  final Color activeTextColor;
  final Color inactiveTextColor;
  final VoidCallback onLeftToggle;
  final VoidCallback onRightToggle;
  final bool isLeftActive;

  const ToggleButton({
    Key? key,
    required this.width,
    required this.height,
    required this.leftDescription,
    required this.rightDescription,
    required this.toggleColor,
    required this.toggleBackgroundColor,
    required this.toggleBorderColor,
    required this.activeTextColor,
    required this.inactiveTextColor,
    required this.onLeftToggle,
    required this.onRightToggle,
    required this.isLeftActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: toggleBackgroundColor,
        borderRadius: BorderRadius.circular(35.0),
        border: Border.all(
          color: toggleBorderColor,
          width: 2.0,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onLeftToggle,
              child: Container(
                decoration: BoxDecoration(
                  color: isLeftActive ? toggleColor : toggleBackgroundColor,
                  borderRadius: BorderRadius.circular(35.0),
                ),
                alignment: Alignment.center,
                child: Text(
                  leftDescription,
                  style: TextStyle(
                    color: isLeftActive ? activeTextColor : inactiveTextColor,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onRightToggle,
              child: Container(
                decoration: BoxDecoration(
                  color: isLeftActive ? toggleBackgroundColor : toggleColor,
                  borderRadius: BorderRadius.circular(35.0),
                ),
                alignment: Alignment.center,
                child: Text(
                  rightDescription,
                  style: TextStyle(
                    color: isLeftActive ? inactiveTextColor : activeTextColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
