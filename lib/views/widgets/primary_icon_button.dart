part of 'widgets.dart';

class PrimaryIconButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final double? height;
  final double? width;

  const PrimaryIconButton({Key? key, required this.title, required this.icon, required this.onTap, this.height, this.width})
      : super(key: key);

  @override
  _PrimaryIconButtonState createState() => _PrimaryIconButtonState();
}

class _PrimaryIconButtonState extends State<PrimaryIconButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width != null ? widget.width : 180,
        height: widget.height != null ? widget.height : 60,
        decoration: BoxDecoration(
          color: Color(0xffA2C90C),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: 24,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Text(
              widget.title,
              style: TextStyle(
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
