part of 'widgets.dart';

class HistoryCard extends StatefulWidget {
  final History history;

  const HistoryCard({Key? key, required this.history}) : super(key: key);

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: Color(0xFFA2C90C)),
      ),
      child: ListTile(
        leading: Image.asset('assets/25.png'),
        title: Text(
          widget.history.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: Text(
                widget.history.date,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            const VerticalDivider(width: 1),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                "${widget.history.bookingType} type",
                style: const TextStyle(fontSize: 12),
              ),
            ),
            const VerticalDivider(width: 1),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                "${widget.history.timeUsed} minutes",
                style: const TextStyle(fontSize: 12),
              ),
            ),
            const VerticalDivider(width: 1),
            const SizedBox(width: 8),
            Text(
              "Rp ${widget.history.price}",
              style: const TextStyle(fontSize: 12, color: Color(0xFFA2C90C)),
            ),
          ],
        ),
      ),
    );
  }
}
