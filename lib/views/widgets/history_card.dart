part of 'widgets.dart';

class HistoryCard extends StatelessWidget {
  final History history;

  const HistoryCard({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: CustomColors.primary),
      ),
      child: ListTile(
        leading: Image.asset('assets/25.png'),
        title: Text(
          history.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: Text(
                history.date,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            const VerticalDivider(width: 1),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                "${history.bookingType} type",
                style: const TextStyle(fontSize: 12),
              ),
            ),
            const VerticalDivider(width: 1),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                "${history.timeUsed} minutes",
                style: const TextStyle(fontSize: 12),
              ),
            ),
            const VerticalDivider(width: 1),
            const SizedBox(width: 8),
            Text(
              "Rp ${history.price}",
              style: const TextStyle(fontSize: 12, color: CustomColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
