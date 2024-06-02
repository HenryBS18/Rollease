part of 'widgets.dart';

class BorderCorner extends StatelessWidget {
  final Widget child;
  const BorderCorner({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xff768EAA), width: 12),
                left: BorderSide(color: Color(0xff768EAA), width: 12),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xff768EAA), width: 12),
                right: BorderSide(color: Color(0xff768EAA), width: 12),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xff768EAA), width: 12),
                left: BorderSide(color: Color(0xff768EAA), width: 12),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xff768EAA), width: 12),
                right: BorderSide(color: Color(0xff768EAA), width: 12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
