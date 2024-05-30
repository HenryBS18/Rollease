part of 'widgets.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final IconData icon;

  const CustomAppBar({Key? key, required this.title, required this.icon}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_sharp,
          size: 32,
          color: Colors.black,
        ),
      ),
      title: Row(
        children: [
          Icon(
            widget.icon,
            color: CustomColors.primary, // Ensure CustomColors.primary is defined in your project
            size: 32,
          ),
          const SizedBox(width: 8),
          Text(
            widget.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
