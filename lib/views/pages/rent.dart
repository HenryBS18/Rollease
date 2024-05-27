import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'rent.dart';
import 'promoScreen.dart';

class RentDuration extends StatefulWidget {
  const RentDuration({Key? key}) : super(key: key);

  @override
  _RentDurationState createState() => _RentDurationState();
}

class _RentDurationState extends State<RentDuration> {
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
                    child: const Card(
                      elevation: 0,
                      color: Color(0x4DA2C90C),
                      child: SizedBox(
                        width: 137.57,
                        height: 180.44,
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Image(
                                  image: AssetImage(
                                    "25.png",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Scooter 1",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Station A",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_sharp,
                              color: Color(0xFFA2C90C),
                            ),
                            Expanded(
                              child: Text(
                                "Kampus UC Makassar",
                                style: TextStyle(
                                    color: Color(
                                      0xFFA2C90C,
                                    ),
                                    fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Power",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "89%",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Image(
                                image: AssetImage(
                              "Battery90.png",
                            ))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                "Type of Rent",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide:
                        BorderSide(color: Color(0xFFA2C90C), width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide:
                        BorderSide(color: Color(0xFFA2C90C), width: 2.0),
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
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Cost",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                "RP300.000/meter",
                style: TextStyle(fontSize: 18, color: Color(0xFFA2C90C)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Payment Method",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                margin: EdgeInsets.only(top: 10, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xFFA2C90C)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "OVO",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.wallet, color: Colors.grey),
                        SizedBox(width: 8),
                        Text(
                          "Rp71.400",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Text(
                    "Once your riding session is over, you can apply ",
                    style: TextStyle(fontSize: 10),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PromoScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "promo codes",
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFFA2C90C),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: FadeInUp(
                  duration: Duration(milliseconds: 1400),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      MaterialButton(
                        height: 45,
                        minWidth: 160,
                        onPressed: () {},
                        color: Color(0xFFA2C90C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: const Text(
                          "Book",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
