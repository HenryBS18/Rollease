part of 'pages.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPage();
}

class _OnBoardingPage extends State<OnBoardingPage> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<OnboardingItem> listOfItems = [
      OnboardingItem(
        img: "assets/Icon3.png",
        title: "Pesan melalui aplikasi",
      ),
      OnboardingItem(
        img: "assets/Icon4.png",
        title: "Pilih tipe kendaraan",
      ),
      OnboardingItem(
        img: "assets/Icon4.png",
        title: "Scan QR Code",
      ),
      OnboardingItem(
        img: "assets/Icon4(1).png",
        title: "Mengendarai",
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 64, left: 24),
            child: Row(
              children: [
                Image.asset(
                  "assets/LogoUtama.png",
                  width: 96,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
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
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.5,
                      child: CustomAnimatedWidget(
                        index: index,
                        delay: 100,
                        child: Image.asset(
                          listOfItems[index].img,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomAnimatedWidget(
                        index: index,
                        delay: 300,
                        child: Text(
                          listOfItems[index].title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          SizedBox(
            height: 10,
            child: SmoothPageIndicator(
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
          ),
          const SizedBox(height: 48),
          PrimaryButton(
            title: "Get started",
            onTap: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.setBool("skip-onboarding", true);
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
