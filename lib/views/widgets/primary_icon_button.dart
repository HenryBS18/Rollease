part of 'widgets.dart';

class PrimaryIconButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final double height;
  final double width;

  const PrimaryIconButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.height = 60,
    this.width = 180,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: CustomColors.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Text(
              title,
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
