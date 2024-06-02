part of 'widgets.dart';

class DebitCard extends StatelessWidget {
  final String name;

  const DebitCard({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: CustomColors.primary,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 18),
                ),
                Image.asset(
                  "assets/mastercard.png",
                  width: 24,
                  height: 12,
                )
              ],
            ),
            const SizedBox(width: 24),
            const Text(
              "******789",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
