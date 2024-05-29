part of 'widgets.dart';

class PrimaryButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final double? height;
  final double? width;

  const PrimaryButton({Key? key, required this.title, required this.onTap, this.height, this.width}) : super(key: key);

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width ?? 180,
        height: widget.height ?? 60,
        decoration: BoxDecoration(
          color: const Color(0xffA2C90C),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
