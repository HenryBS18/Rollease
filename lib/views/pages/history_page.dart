part of 'pages.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

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
        title: Text(
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
                      Icons.history,
                      size: 30,
                      color: Color(0xFFA2C90C),
                    ),
                  ),
                  SizedBox(width: 0),
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
              SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)), side: BorderSide(color: Color(0xFFA2C90C))),
                child: ListTile(
                  leading: Image.asset('assets/25.png'),
                  title: Text("Electric Scooter", style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Row(
                    children: [
                      Expanded(
                        child: Text(
                          "20 April 2023",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      VerticalDivider(
                        width: 1,
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          "Argo type",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      VerticalDivider(
                        width: 1,
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          "100 minutes",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      VerticalDivider(
                        width: 1,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Rp43.000",
                        style: TextStyle(fontSize: 12, color: Color(0xFFA2C90C)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)), side: BorderSide(color: Color(0xFFA2C90C))),
                child: ListTile(
                    leading: Image.asset('assets/102.png'),
                    title: Text("Electric Bike", style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            "22 April 2023",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        VerticalDivider(
                          width: 1,
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            "Rent type",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        VerticalDivider(
                          width: 1,
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            "90 minutes",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        VerticalDivider(
                          width: 1,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Rp73.000",
                          style: TextStyle(fontSize: 12, color: Color(0xFFA2C90C)),
                        ),
                      ],
                    )),
              ),
              SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)), side: BorderSide(color: Color(0xFFA2C90C))),
                child: ListTile(
                  leading: Image.asset('assets/25.png'),
                  title: Text("Electric Scooter", style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Row(
                    children: [
                      Expanded(
                        child: Text(
                          "20 April 2023",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      VerticalDivider(
                        width: 1,
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          "Argo type",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      VerticalDivider(
                        width: 1,
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          "100 minutes",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      VerticalDivider(
                        width: 1,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Rp43.000",
                        style: TextStyle(fontSize: 12, color: Color(0xFFA2C90C)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)), side: BorderSide(color: Color(0xFFA2C90C))),
                child: ListTile(
                    leading: Image.asset('assets/102.png'),
                    title: Text(
                      "Electric Bike",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            "22 April 2023",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        VerticalDivider(
                          width: 1,
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            "Rent type",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        VerticalDivider(
                          width: 1,
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            "90 minutes",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        VerticalDivider(
                          width: 1,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Rp73.000",
                          style: TextStyle(fontSize: 12, color: Color(0xFFA2C90C)),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
