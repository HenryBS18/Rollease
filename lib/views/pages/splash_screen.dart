// ignore_for_file: use_build_context_synchronously

part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkOnboarding() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool("skip-onboarding") != null) {
      Navigator.of(context).pushReplacementNamed('/home');
      return;
    }
  }

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      checkOnboarding();
      Navigator.of(context).pushReplacementNamed('/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "assets/LogoUtama.png",
          width: MediaQuery.of(context).size.width * 0.8,
        ),
      ),
    );
  }
}
