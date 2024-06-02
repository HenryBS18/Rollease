part of 'pages.dart';

class PhotoResultPage extends StatelessWidget {
  const PhotoResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PhotoBloc, PhotoState>(builder: (context, state) {
        if (state is PhotoResult) {
          String imagePath = state.imagePath;

          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.file(File(imagePath), fit: BoxFit.fill),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 220,
                          color: Colors.black.withOpacity(0.6),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 64),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.close,
                                        size: 64,
                                        color: Colors.white,
                                      ),
                                      style: const ButtonStyle(
                                          backgroundColor: MaterialStatePropertyAll(Colors.red),
                                          fixedSize: MaterialStatePropertyAll(Size(96, 96))),
                                      onPressed: () {
                                        context.read<PhotoBloc>().add(ResetPhotoEvent());
                                        Navigator.pop(context);
                                      },
                                    ),
                                    const SizedBox(width: 76),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.done,
                                        size: 64,
                                        color: Colors.white,
                                      ),
                                      style: const ButtonStyle(
                                          backgroundColor: MaterialStatePropertyAll(Colors.green),
                                          fixedSize: MaterialStatePropertyAll(Size(96, 96))),
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/bill');
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
