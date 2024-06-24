part of 'pages.dart';

class TutorialBookingPage extends StatefulWidget {
  const TutorialBookingPage({Key? key}) : super(key: key);

  @override
  State<TutorialBookingPage> createState() => _TutorialBookingPageState();
}

class _TutorialBookingPageState extends State<TutorialBookingPage> {
  bool isRent = false;
  bool dontShowAgainCheck = false;

  final List<OnBoarding> argoOnBoardingList = [
    OnBoarding(
      title: 'Pick the type of electric vehicle you want',
      description: '',
      image: 'assets/TORArgo1.png',
    ),
    OnBoarding(
      title: 'Use the electric vehicle freely in the CPI area',
      description: ' ',
      image: 'assets/TORArgoo2.png',
    ),
    OnBoarding(
      title: 'Pay according to the total duration of use of the electric vehicle',
      description: ' ',
      image: 'assets/TORArgo3.png',
    ),
  ];

  final List<OnBoarding> rentOnBoardingList = [
    OnBoarding(
      title: 'Take the electric vehicle that you want',
      description: ' ',
      image: 'assets/TORArgo1.png',
    ),
    OnBoarding(
      title: 'Choose the length of time you would like to rent the electric vehicle.',
      description: ' ',
      image: 'assets/torargo2.png',
    ),
    OnBoarding(
      title: 'Use the electric vehicle freely in the CPI area',
      description: ' ',
      image: 'assets/TORArgoo2.png',
    ),
    OnBoarding(
      title: 'Pay according to the duration that has been selected.',
      description: ' ',
      image: 'assets/TORArgo3.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

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
                isRent = value;
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
              value: dontShowAgainCheck,
              onChanged: (value) async {
                dontShowAgainCheck = value!;
                setState(() {});
                if (value == true) {
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  pref.setBool("dont-show-tutorial", value);
                  return;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
