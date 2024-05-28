import 'package:flutter/material.dart';
import 'package:rollease/views/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rollease",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
        '/payment': (context) => const PaymentPage(),
        '/promo': (context) => const PromoPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/rent': (context) => const RentDuration(),
        '/tnc': (context) => const TermsAndConditonsPage(),
        '/onBoarding': (context) => const OnBoardingPage(),
        '/tutorial': (context) => const TutorialBookingPage(),
        '/profile': (context) => const ProfilePage(),
        '/history': (context) => const HistoryPage(),
        '/howToRide': (context) => const HowToRidePage(),
        '/scan': (context) => const ScanQrPage(),
        '/end': (context) => const EndRidePage(),
        '/bill': (context) => const BillInfo(),
      },
    );
  }
}
