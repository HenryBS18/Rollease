part of 'widgets.dart';

class CameraErrorDialog extends StatelessWidget {
  final VoidCallback? onTap;

  const CameraErrorDialog({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      content: const Text(
        "Oops!! Something went wrong when taking a picture.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 18,
          color: Colors.red,
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            onTap!();
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.red),
            fixedSize: MaterialStatePropertyAll(Size(120, 56)),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
          ),
          child: const Text(
            "Try again",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
