part of 'widgets.dart';

class CustomAnimatedWidget extends StatelessWidget {
  final int index;
  final int delay;
  final Widget child;

  const CustomAnimatedWidget({Key? key, required this.index, required this.delay, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index == 1) {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }
}
