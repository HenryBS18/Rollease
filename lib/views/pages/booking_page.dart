part of 'pages.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String? _selectedRentType;

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
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 0,
                    color: const Color(0x4DA2C90C),
                    child: SizedBox(
                      width: 137.57,
                      height: 180.44,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/25.png",
                              fit: BoxFit.fill,
                              width: 120,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Scooter 1",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Station A",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on_sharp,
                            color: Color(0xFFA2C90C),
                          ),
                          Text(
                            "Kampus UC Makassar",
                            style: TextStyle(color: Color(0xFFA2C90C), fontSize: 12),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Power",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Text(
                            "89%",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Image.asset("assets/Battery90.png")
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              "Type of Rent",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Color(0xFFA2C90C), width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Color(0xFFA2C90C), width: 2.0),
                ),
                hintText: 'Pilih jenis sewa',
              ),
              value: _selectedRentType,
              items: <String>['Argo', 'Duration'].map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: SizedBox(
                    width: 200,
                    child: Text(value),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRentType = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Cost",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "RP300.000/meter",
              style: TextStyle(fontSize: 18, color: Color(0xFFA2C90C)),
            ),
            const SizedBox(height: 20),
            const Text(
              "Payment Method",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            itemProfile("OVO", Icons.wallet),
            const SizedBox(height: 32),
            Center(
              child: PrimaryButton(
                title: "Book",
                onTap: () {
                  Navigator.pushNamed(context, '/scan');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
