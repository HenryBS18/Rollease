part of 'pages.dart';

class TutorialBookingPage extends StatefulWidget {
  const TutorialBookingPage({Key? key}) : super(key: key);

  @override
  State<TutorialBookingPage> createState() => _TutorialBookingPageState();
}

class _TutorialBookingPageState extends State<TutorialBookingPage> {
  bool isRent = false;
  bool dontShowAgain = false;

  void toggleToLeft() {
    setState(() {
      isRent = false;
    });
  }

  void toggleToRight() {
    setState(() {
      isRent = true;
    });
  }

  final List<OnBoarding> argoOnBoardingList = [
    OnBoarding(
      title: 'Ambil tipe kendaraan yang anda inginkan',
      description: '',
      image: 'assets/TORArgo1.png',
    ),
    OnBoarding(
      title: 'Gunakan kendaraan listrik tersebut secara bebas di kawasan CPI',
      description: ' ',
      image: 'assets/TORArgoo2.png',
    ),
    OnBoarding(
      title: 'Bayar sesuai dengan total durasi pemakaian kendaraan listrik.',
      description: ' ',
      image: 'assets/TORArgo3.png',
    ),
  ];

  final List<OnBoarding> rentOnBoardingList = [
    OnBoarding(
      title: 'Ambil tipe kendaraan listrik yang anda inginkan',
      description: ' ',
      image: 'assets/TORArgo1.png',
    ),
    OnBoarding(
      title: 'Pilih lama durasi yang anda inginkan untuk menyewa kendaraan listrik',
      description: ' ',
      image: 'assets/torargo2.png',
    ),
    OnBoarding(
      title: 'Gunakan kendaraan listrik tersebut secara bebas di kawasan CPI',
      description: ' ',
      image: 'assets/TORArgoo2.png',
    ),
    OnBoarding(
      title: 'Bayar sesuai dengan durasi yang telah dipilih.',
      description: ' ',
      image: 'assets/TORArgo3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text(
            "Type of Rent",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SlidingSwitch(
            value: isRent,
            onChanged: (value) {
              setState(() {
                isRent = !value;
              });
            },
            onTap: () {},
            onDoubleTap: () {},
            onSwipe: () {},
            textOff: "Argo",
            textOn: "Duration",
            contentSize: 16,
            background: const Color(0xffB6C4D4),
            buttonColor: const Color(0xFFA2C90C),
            colorOff: Colors.white,
            colorOn: Colors.white,
            inactiveColor: Colors.white,
          ),
          const SizedBox(height: 8),
          isRent ? TypeOfRent(onBoardingList: rentOnBoardingList) : TypeOfRent(onBoardingList: argoOnBoardingList),
          const SizedBox(height: 32),
          PrimaryButton(
            title: "Skip",
            onTap: () {
              Navigator.pushNamed(context, '/booking');
            },
          ),
          const SizedBox(height: 16),
          Center(
            child: MyCheckbox(
              value: dontShowAgain,
              onChanged: (value) {
                setState(() {
                  dontShowAgain = value!;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
