part of 'pages.dart';

class EndRidePage extends StatefulWidget {
  const EndRidePage({Key? key}) : super(key: key);

  @override
  _EndRidePageState createState() => _EndRidePageState();
}

class _EndRidePageState extends State<EndRidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("End"),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/bill');
        },
        child: const Text("End"),
      ),
    );
  }
}
