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
          Expanded(
            flex: 3,
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
                          const SizedBox(height: 20),
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
                      ),
                    ),
                    Positioned(
                      top: 66,
                      left: 21,
                      child: Image.asset(
                        "assets/LogoUtama.png",
                        width: 89,
                        height: 74,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 45), // Atur jarak dengan bottom
              child: Column(
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
                      expansionFactor: 3.8,
                      dotColor: Color(
                        0xFFA2C90C,
                      ),
                      activeDotColor: Color(0xFFA2C90C),
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
                  const Spacer(),
                  currentIndex == listOfItems.length - 1
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: PrimaryButton(
                            title: "Get started",
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: PrimaryButton(
                            title: "Skip",
                            onTap: () {
                              setState(() {
                                pageController.animateToPage(
                                  3,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.fastOutSlowIn,
                                );
                              });
                            },
                          ),
                        ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
