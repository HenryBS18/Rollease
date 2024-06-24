part of 'widgets.dart';

class RatingAlert extends StatelessWidget {
  const RatingAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(0),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 32,
                    )),
              ],
            ),
            Image.asset(
              "assets/rate.png",
              width: 220,
            ),
            const SizedBox(height: 8),
            const Text(
              "How was your trip?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: SizedBox(
                width: 260,
                child: FivePointedStar(
                  color: const Color(0xffD9D9D9),
                  selectedColor: CustomColors.primary,
                  size: const Size(48, 48),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
