part of 'widgets.dart';

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double? radius;
  final Color? color;
  const PrimaryContainer({
    Key? key,
    this.radius,
    this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 30),
        color: Colors.white,
        border: Border.all(color: const Color(0xFFA2C90C)),
      ),
      child: child,
    );
  }
}
