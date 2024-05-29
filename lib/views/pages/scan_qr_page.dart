part of 'pages.dart';

class ScanQrPage extends StatefulWidget {
  const ScanQrPage({Key? key}) : super(key: key);

  @override
  _ScanQrPageState createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan"),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/howToRide');
        },
        child: const Text("Next"),
      ),
    );
  }
}
