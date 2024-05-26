import 'package:flutter/material.dart';
import 'package:rollease/models/DotsDecorator.dart';

class DotsIndicator extends StatelessWidget {
  final int dotsCount;
  final int position;
  final DotsDecorator decorator;

  const DotsIndicator({super.key, required this.dotsCount, required this.position, required this.decorator});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        dotsCount,
        (index) => _buildDot(index),
      ),
    );
  }

  Widget _buildDot(int index) {
    bool isActive = index == position;
    return Container(
      width: isActive ? decorator.activeSize.width : decorator.size.width,
      height: isActive ? decorator.activeSize.height : decorator.size.height,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? decorator.activeColor : decorator.color,
      ),
    );
  }
}
