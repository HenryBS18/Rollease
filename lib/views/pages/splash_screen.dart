part of 'pages.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Tunggu selama 3 detik sebelum berpindah ke OnBoardingScreen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => OnBoardingPage()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "images/LogoUtama.png",
          width: MediaQuery.of(context).size.width * 0.8,
        ),
      ),
    );
  }
}
