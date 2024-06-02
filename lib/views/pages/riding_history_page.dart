part of 'pages.dart';

class RidingHistoryPage extends StatefulWidget {
  const RidingHistoryPage({Key? key}) : super(key: key);

  @override
  State<RidingHistoryPage> createState() => _RidingHistoryPageState();
}

class _RidingHistoryPageState extends State<RidingHistoryPage> {
  List<History> history = [
    History("Eletric Scooter", "20 April 2023", "Argo", 100, 43000),
    History("Eletric Bike", "23 April 2023", "Rent", 50, 72000),
    History("Eletric Scooter", "25 April 2023", "Argo", 20, 25000),
    History("Eletric Bike", "28 April 2023", "Rent", 75, 74000),
    History("Eletric Scooter", "2 Mei 2023", "Argo", 23, 105000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Riding History", icon: Icons.history),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: HistoryCard(
                      history: history[index],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
