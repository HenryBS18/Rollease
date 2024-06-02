part of 'widgets.dart';

class BookingModeBottomSheet extends StatefulWidget {
  const BookingModeBottomSheet({Key? key}) : super(key: key);

  @override
  _BookingModeBottomSheetState createState() => _BookingModeBottomSheetState();
}

class _BookingModeBottomSheetState extends State<BookingModeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      maxChildSize: 0.4,
      minChildSize: 0.4,
      expand: true,
      snap: true,
      snapSizes: const [0.4],
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: CustomColors.primary,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SliverList.list(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: 200,
                              padding: const EdgeInsets.only(top: 24, bottom: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xffe4efb7),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      'assets/25.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    "Scooter A",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Trip in Progress",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      child: const Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Distance",
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                              ),
                                              Text(
                                                "12 m",
                                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                              )
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Spent",
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                              ),
                                              Text(
                                                "Rp 3.600",
                                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Battery",
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              "assets/Battery 90%.png",
                                              width: 32,
                                            ),
                                            const Text(
                                              "90%",
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: PrimaryButton(
                                title: "End Ride",
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.white,
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.close,
                                                size: 32,
                                              ),
                                            ),
                                          ],
                                        ),
                                        content: const Text(
                                          "Are you sure you want to end ride session?",
                                          overflow: TextOverflow.clip,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        actions: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                style: ButtonStyle(
                                                  backgroundColor: const MaterialStatePropertyAll(Color(0xffFC6464)),
                                                  fixedSize: const MaterialStatePropertyAll(Size(110, 44)),
                                                  shape: MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.pushNamed(context, '/photo');
                                                },
                                                child: const Text(
                                                  "Yes",
                                                  style: TextStyle(fontSize: 20, color: Colors.white),
                                                ),
                                              ),
                                              const SizedBox(width: 24),
                                              TextButton(
                                                style: ButtonStyle(
                                                  backgroundColor: const MaterialStatePropertyAll(Colors.white),
                                                  fixedSize: const MaterialStatePropertyAll(Size(110, 44)),
                                                  shape: MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(8),
                                                      side: const BorderSide(color: Colors.black, width: 2),
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  "No",
                                                  style: TextStyle(fontSize: 20, color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
