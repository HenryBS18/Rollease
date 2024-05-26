import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rollease/provider/navigation_provider.dart';
import 'package:rollease/views/pages/profile_page.dart';
import 'package:rollease/views/widgets/typeofrent1.dart';
import 'package:rollease/views/widgets/typeofrent2.dart';
import 'package:rollease/views/widgets/togglebutton.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Type of Rent';


  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          home: MainPage(),
        ),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isLeftActive = true;

  void toggleToLeft() {
    setState(() {
      isLeftActive = true;
    });
  }

  void toggleToRight() {
    setState(() {
      isLeftActive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ToggleButton(
              width: 200,
              height: 50,
              isLeftActive: isLeftActive,
              leftDescription: "Argo",
              rightDescription: "Rent",
              toggleColor: Colors.green,
              toggleBackgroundColor: const Color.fromARGB(255, 230, 230, 230),
              toggleBorderColor: const Color.fromARGB(255, 255, 255, 255),
              activeTextColor: Colors.white,
              inactiveTextColor: const Color.fromARGB(255, 164, 164, 164),
              onLeftToggle: toggleToLeft,
              onRightToggle: toggleToRight,
            ),
          ),
          Expanded(
            child: isLeftActive ? TypeOfRent1() : TypeOfRent2(),
          ),
        ],
      ),
    );
  }
}
