part of 'pages.dart';

class BillInfoPage extends StatelessWidget {
  const BillInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('dd MMM yyyy, HH:mm').format(now);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: const BoxDecoration(
              color: Color(0xFF7A92B8),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50.0),
              ),
            ),
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(top: 32),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                    image: AssetImage('assets/bg_receipt.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.48,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      'assets/LogoUtama.png',
                                      width: 44,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  formattedDate,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Your Bill Information',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Column(
                            children: [
                              BillInfoText(label: 'Type of Vehicle', value: 'Electric Scooter'),
                              BillInfoText(label: 'Type of Rent', value: 'Argo Type'),
                              BillInfoText(label: 'Vehicle pick up', value: 'Station A'),
                              BillInfoText(label: 'Vehicle drop off', value: 'Station C'),
                              BillInfoText(label: 'Distance', value: '54 m'),
                              BillInfoText(label: 'Spend', value: 'Rp 43.400,-'),
                              BillInfoText(label: 'Discount', value: 'Rp -'),
                            ],
                          ),
                          const Divider(),
                          const BillInfoText(label: 'Grand Total', value: 'Rp 43.400,-', isTotal: true),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 48),
                      child: Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const Text(
                            'Thank You for using our services.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              color: Color(0xff809B16),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Payment method',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/payment');
                    },
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: CustomColors.primary,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "OVO",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff8444B7),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "Rp 320.000",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/promo');
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 12),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: CustomColors.secondary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "USE PROMO OR VOUCHER HERE",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: Color(0xff5E7408),
                            ),
                          ),
                          Container(
                            width: 84,
                            height: 56,
                            color: const Color(0xff5E7408),
                            padding: const EdgeInsets.all(8),
                            child: Image.asset("assets/disc.png"),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            title: "Pay",
            width: MediaQuery.of(context).size.width * 0.9,
            height: 56,
            onTap: () {
              context.read<ModeBloc>().add(NormalModeEvent());
              Navigator.pushNamed(context, '/home');
            },
          )
        ],
      ),
    );
  }
}
