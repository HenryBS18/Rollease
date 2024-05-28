part of 'pages.dart';

class HowToRidePage extends StatefulWidget {
  const HowToRidePage({Key? key}) : super(key: key);

  @override
  State<HowToRidePage> createState() => _OnBoarding();
}

class _OnBoarding extends State<HowToRidePage> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  List<Items> listOfItems = [
    Items(
      img: "assets/Artboard6.png",
      title: "Unlock the electric vehicle",
    ),
    Items(
      img: "assets/Artboard5.png",
      title: "Put helmet on",
    ),
    Items(
      img: "assets/TORArgoo2.png",
      title: "Start riding",
    ),
    Items(
      img: "assets/Artboard8.png",
      title: "Adjust the speed and stay in designated areas",
    ),
    Items(
      img: "assets/Artboard9.png",
      title: "Always check the time limit of your rent vehicle",
    ),
    Items(
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
    var size = MediaQuery.of(context).size;
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
        title: const Text(
          "Back",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
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
                          Container(
                            width: size.width,
                            height: size.height / 2.5,
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
                                  fontSize: 15,
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
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 45),
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
                      dotColor: Color(0xFFA2C90C),
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
                            title: "Start",
                            onTap: () {
                              Navigator.pushNamed(context, '/end');
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
                                  currentIndex + 1,
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
