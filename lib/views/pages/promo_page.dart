part of 'pages.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({Key? key}) : super(key: key);

  @override
  _PromoScreenState createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            size: 20,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.label,
                      size: 30,
                      color: Color(0xFFA2C90C),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Promos",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // Add a Container for the search bar section
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    onChanged: (value) {
                      filterPromo(value);
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Promo Here",
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)), side: BorderSide(color: Color(0xFFA2C90C))),
                    child: ListTile(
                      leading: Image.asset('disc1.png'),
                      title: Text(
                        filteredList[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        promoSubtitleList[index],
                        style: TextStyle(fontSize: 11),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFA2C90C),
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
