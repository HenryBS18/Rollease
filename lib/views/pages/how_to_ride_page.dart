part of 'pages.dart';

class HowToRidePage extends StatefulWidget {
  const HowToRidePage({Key? key}) : super(key: key);

  @override
  State<HowToRidePage> createState() => _HowToRidePage();
}

class _HowToRidePage extends State<HowToRidePage> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  bool dontShowAgain = false;

  List<OnboardingItem> listOfItems = [
    OnboardingItem(
      img: "assets/Artboard6.png",
      title: "Unlock the electric vehicle",
    ),
    OnboardingItem(
      img: "assets/Artboard5.png",
      title: "Put helmet on",
    ),
    OnboardingItem(
      img: "assets/TORArgoo2.png",
      title: "Start riding",
    ),
    OnboardingItem(
      img: "assets/Artboard8.png",
      title: "Adjust the speed and stay in designated areas",
    ),
    OnboardingItem(
      img: "assets/Artboard9.png",
      title: "Always check the time limit of your rent vehicle",
    ),
    OnboardingItem(
      img: "assets/TORArgo1.png",
      title: "Return the vehicle at the nearest station",
    ),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

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
            size: 32,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "how to ride??",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            // color: Colors.red,
            margin: const EdgeInsets.only(top: 32),
            child: PageView.builder(
              controller: pageController,
              itemCount: listOfItems.length,
              onPageChanged: (newIndex) {
                setState(() {
                  currentIndex = newIndex;
                });
              },
              physics: const BouncingScrollPhysics(),
              itemBuilder: ((context, index) {
                return Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: CustomAnimatedWidget(
                              index: index,
                              delay: 100,
                              child: Image.asset(
                                listOfItems[index].img,
                                fit: BoxFit.contain,
                                width: 320,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 48),
                            child: CustomAnimatedWidget(
                              index: index,
                              delay: 300,
                              child: Text(
                                listOfItems[index].title,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          const SizedBox(height: 48),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: pageController,
                count: listOfItems.length,
                effect: const ExpandingDotsEffect(
                  spacing: 6.0,
                  radius: 10.0,
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  expansionFactor: 2,
                  dotColor: CustomColors.primary,
                  activeDotColor: CustomColors.primary,
                ),
                onDotClicked: (newIndex) {
                  setState(() {
                    currentIndex = newIndex;
                    pageController.animateToPage(
                      newIndex,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  });
                },
              ),
              const SizedBox(height: 48),
              PrimaryButton(
                title: "Skip",
                onTap: () {
                  context.read<ModeBloc>().add(BookingModeEvent());
                  Navigator.pushReplacementNamed(context, '/home');
                },
              ),
              const SizedBox(height: 16),
              MyCheckbox(
                value: dontShowAgain,
                onChanged: (value) async {
                  dontShowAgain = value!;
                  setState(() {});
                  if (value == true) {
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    pref.setBool("dont-show-htr", value);
                    return;
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
