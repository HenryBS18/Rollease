import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rollease/views/pages/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashRent extends StatefulWidget {
  const SplashRent({Key? key}) : super(key: key);

  @override
  State<SplashRent> createState() => _OnBoarding();
}

class _OnBoarding extends State<SplashRent> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

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
                            onTap: () {
                            
                               
                            },
                            text: 'Get Started',
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: PrimaryButton(
                            onTap: () {
                              setState(() {
                                pageController.animateToPage(
                                  currentIndex + 1,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.fastOutSlowIn,
                                );
                              });
                            },
                            text: 'Start',
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

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const PrimaryButton({Key? key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.maxFinite, 53),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: const Color(0xFFA2C90C),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CustomAnimatedWidget extends StatelessWidget {
  final int index;
  final int delay;
  final Widget child;
  const CustomAnimatedWidget({
    Key? key,
    required this.index,
    required this.delay,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index == 1) {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }
}

class Items {
  final String img;
  final String title;

  Items({
    required this.img,
    required this.title,
  });
}

List<Items> listOfItems = [
  Items(
    img: "TORArgo1.png",
    title: "Unlock the electric vehicle",
  ),
  Items(
    img: "Artboard5.png",
    title: "Put helmet on",
  ),
  Items(
    img: "TORArgo2.png",
    title: "Start riding",
  ),
  Items(
    img: "Artboard8.png",
    title: "Adjust the speed and stay in designated areas",
  ),
  Items(
    img: "Artboard9.png",
    title: "Always check the time limit of your rent vehicle",
  ),
  Items(
    img: "Artboard6.png",
    title: "Return the vehicle at the nearest station",
  ),
];
