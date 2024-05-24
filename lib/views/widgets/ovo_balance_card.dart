part of 'widgets.dart';

class OvoBalanceCard extends StatefulWidget {
  const OvoBalanceCard({Key? key}) : super(key: key);

  @override
  _OvoBalanceCardState createState() => _OvoBalanceCardState();
}

class _OvoBalanceCardState extends State<OvoBalanceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffA2C90C),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Balance",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff81895F),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Rp. 250.000",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff81895F),
                  ),
                ),
              ],
            ),
            Text(
              "OVO",
              style: TextStyle(
                color: Color(0xff8444B7),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
