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
      appBar: const CustomAppBar(title: "Profile", icon: Icons.wallet_outlined),
      body: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
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
        ),
      ),
    );
  }
}
