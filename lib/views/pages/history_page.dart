part of 'pages.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            size: 24,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Back",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.history,
                  size: 32,
                  color: CustomColors.primary,
                ),
                SizedBox(width: 8),
                Text(
                  "Riding History",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
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
