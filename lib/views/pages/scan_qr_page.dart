// ignore_for_file: use_build_context_synchronously

part of 'pages.dart';

class ScanQrPage extends StatefulWidget {
  const ScanQrPage({Key? key}) : super(key: key);

  @override
  _ScanQrPageState createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            size: 32,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32, top: 64),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text(
                  "SCAN",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: CustomColors.primary),
                ),
                const Text(
                  "The QR Code on the Scooter",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 64),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: BorderCorner(child: _buildQrView(context)),
                ),
                const SizedBox(height: 48),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.keyboard_outlined,
                          color: Color(0xff6d811f),
                        ),
                        color: Colors.red,
                        iconSize: 48,
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Color.fromARGB(127, 163, 201, 12)),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          try {
                            await controller?.toggleFlash();
                            setState(() {});
                          } catch (e) {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const Row(
                                  children: [
                                    Center(
                                      child: Text("Flash not found"),
                                    )
                                  ],
                                );
                              },
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.flashlight_on_outlined,
                          color: Color(0xff6d811f),
                        ),
                        color: Colors.red,
                        iconSize: 48,
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Color.fromARGB(127, 163, 201, 12)),
                        ),
                      )
                    ],
                  ),
                ),
                result != null
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}',
                          style: const TextStyle(overflow: TextOverflow.clip),
                        ),
                      )
                    : const Text('kosong'),
                const SizedBox(height: 24),
                PrimaryButton(
                  title: "Next",
                  onTap: () async {
                    controller!.stopCamera();

                    SharedPreferences pref = await SharedPreferences.getInstance();
                    if (pref.getBool("dont-show-htr") != null) {
                      context.read<ModeBloc>().add(BookingModeEvent());
                      Navigator.pushNamed(context, '/home');
                      return;
                    }

                    Navigator.pushNamed(context, '/how-to-ride');
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
