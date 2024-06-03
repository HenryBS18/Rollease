import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rollease/bloc/current_station_bloc/current_station_bloc.dart';
import 'package:rollease/bloc/mode_bloc/mode_bloc.dart';
import 'package:rollease/bloc/photo_bloc/photo_bloc.dart';
import 'package:rollease/bloc/selected_vehicle_bloc/selected_vehicle_bloc.dart';
import 'package:rollease/bloc/station_bloc/station_bloc.dart';
import 'package:rollease/views/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ModeBloc()..add(NormalModeEvent())),
        BlocProvider(create: (context) => PhotoBloc()),
        BlocProvider(create: (context) => SelectedVehicleBloc()),
        BlocProvider(create: (context) => StationBloc()),
        BlocProvider(create: (context) => CurrentStationBloc()),
      ],
      child: MaterialApp(
        title: "Rollease",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/ ',
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) => const HomePage(),
          '/payment': (context) => const PaymentPage(),
          '/promo': (context) => const PromoPage(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/booking': (context) => const BookingPage(),
          '/tnc': (context) => const TermsAndConditonsPage(),
          '/onboarding': (context) => const OnBoardingPage(),
          '/tutorial-booking': (context) => const TutorialBookingPage(),
          '/profile': (context) => const ProfilePage(),
          '/history': (context) => const RidingHistoryPage(),
          '/how-to-ride': (context) => const HowToRidePage(),
          '/scan': (context) => const ScanQrPage(),
          '/bill': (context) => const BillInfoPage(),
          '/photo': (context) => const PhotoPage(),
          '/photo-result': (context) => const PhotoResultPage(),
        },
      ),
    );
  }
}
