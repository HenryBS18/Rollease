part of 'widgets.dart';

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double radius;
  const PrimaryContainer({Key? key, this.radius = 30, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Colors.white,
        border: Border.all(color: Colors.black),
      ),
      child: child,
    );
  }
}
