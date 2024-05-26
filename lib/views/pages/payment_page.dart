part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool debitActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
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
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
        child: Column(
          children: [
            const Row(
              children: [
                Icon(
                  Icons.wallet_outlined,
                  size: 30,
                  color: Color(0xFFA2C90C),
                ),
                SizedBox(width: 8),
                Text(
                  "Payment",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              // color: Colors.red,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PaymentCard(
                        title: "Debit",
                        icon: Icons.wallet,
                        isActive: debitActive,
                        onTap: () {
                          setState(() {
                            debitActive = true;
                          });
                        },
                      ),
                      PaymentCard(
                        title: "OVO",
                        icon: Icons.payment,
                        isActive: !debitActive,
                        onTap: () {
                          setState(() {
                            debitActive = false;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Column(
                    children: [
                      debitActive ? const DebitPaymentMenu() : const OvoBalanceCard(),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
