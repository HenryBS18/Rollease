// ignore_for_file: use_build_context_synchronously

part of 'pages.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<PhotoPage> {
  late CameraController _controller;
  Future<void>? _initializeControllerFuture;

  Future<void> initCamera() async {
    final cameras = await availableCameras();

    _controller = CameraController(
      cameras.first,
      ResolutionPreset.ultraHigh,
    );

    setState(() {
      _initializeControllerFuture = _controller.initialize();
    });
  }

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<String> _takePicture() async {
    await _initializeControllerFuture;
    final image = await _controller.takePicture();
    final String imagePath = image.path;

    // do something with here
    return imagePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Positioned.fill(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 0,
                  child: CameraPreview(_controller),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                    color: Colors.black.withOpacity(0.6),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              "Take a photo of the scooter",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsetsDirectional.all(8)),
                          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                          fixedSize: MaterialStatePropertyAll(Size(64, 64)),
                        ),
                        onPressed: () async {
                          try {
                            String imagePath = await _takePicture();
                            context.read<PhotoBloc>().add(AddPhotoEvent(imagePath));
                            _controller.stopImageStream();
                            Navigator.pushNamed(context, '/photo-result');
                          } catch (e) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return CameraErrorDialog(
                                  onTap: () {
                                    initCamera();

                                    Navigator.pop(context);
                                  },
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(99),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
