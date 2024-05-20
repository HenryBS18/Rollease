import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rollease/pages/loginScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoarding();
}

class _OnBoarding extends State<OnBoarding> {
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
                        "images/LogoUtama.png",
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
              padding:
                  const EdgeInsets.only(bottom: 45), // Atur jarak dengan bottom
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
                      dotColor: Color.fromARGB(255, 98, 214, 145),
                      activeDotColor: Colors.green,
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
                            onTap: () { Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()), // Navigasi ke halaman login
                              );
                              //                         Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (_) => LoginScreen()),
                              // );
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
                                  3,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.fastOutSlowIn,
                                );
                              });
                            },
                            text: 'Skip',
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
        backgroundColor: Colors.green,
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
    img: "images/Icon3.png",
    title: "Pesan melalui aplikasi",
  ),
  Items(
    img: "images/Icon4.png",
    title: "Pilih tipe kendaraan",
  ),
  Items(
    img: "images/Icon4.png",
    title: "Scan QR Code",
  ),
  Items(
    img: "images/icon4(1).png",
    title: "Mengendarai",
  ),
];
