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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: Color(0xFFA2C90C)),
      ),
      child: ListTile(
        leading: Image.asset('assets/25.png'),
        title: Text(
          widget.history.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: Text(
                widget.history.date,
                style: TextStyle(fontSize: 12),
              ),
            ),
            VerticalDivider(width: 1),
            SizedBox(width: 8),
            Flexible(
              child: Text(
                "${widget.history.bookingType} type",
                style: TextStyle(fontSize: 12),
              ),
            ),
            VerticalDivider(width: 1),
            SizedBox(width: 8),
            Flexible(
              child: Text(
                "${widget.history.timeUsed} minutes",
                style: TextStyle(fontSize: 12),
              ),
            ),
            VerticalDivider(width: 1),
            SizedBox(width: 8),
            Text(
              "Rp ${widget.history.price}",
              style: TextStyle(fontSize: 12, color: Color(0xFFA2C90C)),
            ),
          ],
        ),
      ),
    );
  }
}
