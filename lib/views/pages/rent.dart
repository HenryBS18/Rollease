part of 'pages.dart';

class RentDuration extends StatefulWidget {
  const RentDuration({Key? key}) : super(key: key);

  @override
  _RentDurationState createState() => _RentDurationState();
}

class _RentDurationState extends State<RentDuration> {
  String? _selectedRentType; // Nilai awal dropdown

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
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Card(
                      elevation: 0,
                      color: Color(0x4DA2C90C),
                      child: SizedBox(
                        width: 137.57,
                        height: 180.44,
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/25.png"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Scooter 1",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Station A",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_sharp,
                            color: Color(0xFFA2C90C),
                          ),
                          Text(
                            "Kampus UC Makassar",
                            style: TextStyle(
                                color: Color(
                                  0xFFA2C90C,
                                ),
                                fontSize: 12),
                          )
                        ],
                      ),
                      SizedBox(height: 7),
                      Text(
                        "Power",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
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
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Type of Rent",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: const BorderSide(color: Color(0xFFA2C90C), width: 1.0), // Adjust color and width as needed
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: const BorderSide(color: Color(0xFFA2C90C), width: 2.0), // Adjust color and width as needed
                  ),
                  hintText: 'Pilih jenis sewa',
                ),
                value: _selectedRentType,
                items: <String>['Rent', 'Duration'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedRentType = newValue;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                "Cost",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "RP300.000/meter",
                style: TextStyle(fontSize: 18, color: Color(0xFFA2C90C)),
              ),
              SizedBox(height: 20),
              Text(
                "Payment Method",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              itemProfile("OVO", Icons.wallet)
            ],
          ),
        ),
      ),
    );
  }
}
