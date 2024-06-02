part of 'widgets.dart';

class BillInfoText extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const BillInfoText({Key? key, required this.label, required this.value, this.isTotal = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 20 : 14,
              color: isTotal ? const Color(0xff809B16) : Colors.black,
              fontWeight: isTotal ? FontWeight.w900 : FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 18 : 14,
              fontWeight: FontWeight.bold,
              color: isTotal ? const Color(0xff809B16) : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
