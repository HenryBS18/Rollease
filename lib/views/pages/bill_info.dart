part of 'pages.dart';

class BillInfo extends StatelessWidget {
  const BillInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mengambil waktu sekarang
    final now = DateTime.now();
    final formattedDate = DateFormat('dd MMM yyyy, HH:mm').format(now);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF7A92B8),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(50.0),
                ),
              ),
              child: Center(
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('assets/bg_receipt.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Logo dan Tanggal/Waktu
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/LogoUtama.png', // Path ke logo Anda
                              height: 70.0,
                            ),
                            Text(
                              formattedDate,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Your Bill Information',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30),
                        _buildBillInfoRow('Type of Vehicle', 'Electric Scooter'),
                        _buildBillInfoRow('Type of Rent', 'Argo Type'),
                        _buildBillInfoRow('Vehicle pick up', 'Station A'),
                        _buildBillInfoRow('Vehicle drop off', 'Station C'),
                        _buildBillInfoRow('Distance', '54 m'),
                        _buildBillInfoRow('Spend', 'Rp 43.400,-'),
                        _buildBillInfoRow('Discount', 'Rp -'),
                        Divider(),
                        _buildBillInfoRow('Grand Total', 'Rp 43.400,-', isBold: true, textColor: Colors.green),
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            'Thank You for using our services.',
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Payment method',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'OVO',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Rp321.100',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: Container(
                              color: Colors.green[700],
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset('assets/disc.png', height: 24.0),
                            ),
                            label: Text('USE PROMO OR VOUCHER HERE'),
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                            minimumSize: Size(double.infinity, 50),
                          ),
                          child: Text(
                            'Pay',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBillInfoRow(String label, String value, {bool isBold = false, Color textColor = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: textColor,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
