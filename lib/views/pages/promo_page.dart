part of 'pages.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({Key? key}) : super(key: key);

  @override
  _PromoPageState createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  List<String> promoList = [
    "Discount Rp10.000",
    "Discount Rp5.000",
    "Discount Rp15.000",
  ];

  List<String> promoSubtitleList = [
    "with minimal 1km distance or 45 minute rent",
    "with minimal 50m distance or 15 minutes rent",
    "with minimal 2km distance or 60 minute rent",
  ];

  List<String> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = promoList;
  }

  void filterPromo(String query) {
    setState(() {
      filteredList = promoList.where((promo) {
        return promo.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Promos", icon: Icons.confirmation_num),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    onChanged: (value) {
                      filterPromo(value);
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter Promo Here",
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(color: CustomColors.primary),
                    ),
                    child: ListTile(
                      leading: Image.asset('assets/disc1.png'),
                      title: Text(
                        filteredList[index],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        promoSubtitleList[index],
                        style: const TextStyle(fontSize: 11),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Claim',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
