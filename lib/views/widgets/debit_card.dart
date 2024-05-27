part of 'widgets.dart';

class DebitCard extends StatefulWidget {
  final String name;

  const DebitCard({Key? key, required this.name}) : super(key: key);

  @override
  State<DebitCard> createState() => _DebitCardState();
}

class _DebitCardState extends State<DebitCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffA2C90C),
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
                  widget.name,
                  style: const TextStyle(fontSize: 20),
                ),
                Image.asset(
                  "assets/mastercard.png",
                  width: 32,
                  height: 20,
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
