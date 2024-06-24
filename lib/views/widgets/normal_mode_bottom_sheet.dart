// ignore_for_file: use_build_context_synchronously

part of 'widgets.dart';

class NormalModeBottomSheet extends StatefulWidget {
  final List<Station> stationList;
  final int currentIndex;

  const NormalModeBottomSheet({Key? key, required this.stationList, required this.currentIndex}) : super(key: key);

  @override
  _NormalModeBottomSheetState createState() => _NormalModeBottomSheetState();
}

class _NormalModeBottomSheetState extends State<NormalModeBottomSheet> {
  bool isBike = false;
  List<Vehicle> availableVehicleList = [];

  int getTotalVehicle({required List<Vehicle> vehicleList, required String type}) {
    int total = 0;

    for (Vehicle vehicle in vehicleList) {
      if (vehicle.type == type && !vehicle.inUse) {
        total += 1;
      }
    }

    return total;
  }

  List<Vehicle> getAvailableVehicleList() {
    final List<Vehicle> vehicleList = widget.stationList[widget.currentIndex].vehicleList;

    if (isBike) {
      return vehicleList.where((Vehicle vehicle) => vehicle.inUse != true && vehicle.type == "Bike").toList();
    }
    return vehicleList.where((Vehicle vehicle) => vehicle.inUse != true && vehicle.type == "Scooter").toList();
  }

  void fetchVehicle() {
    availableVehicleList = getAvailableVehicleList();
  }

  @override
  void didUpdateWidget(covariant NormalModeBottomSheet oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.stationList != oldWidget.stationList) {
      fetchVehicle();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedVehicleBloc, SelectedVehicleState>(
      builder: (context, state) {
        return DraggableScrollableSheet(
          initialChildSize: 0.4,
          maxChildSize: 0.84,
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
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: widget.stationList.isNotEmpty
                            ? Column(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Nearest Station",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.38,
                                              height: 240,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(16),
                                                color: CustomColors.primary,
                                              ),
                                              child: Image.asset(widget.stationList[widget.currentIndex].image, fit: BoxFit.fill),
                                            ),
                                            const SizedBox(width: 8),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context).size.width * 0.5,
                                                  child: Text(
                                                    'Station ${widget.stationList[widget.currentIndex].name}',
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      decoration: TextDecoration.none,
                                                      overflow: TextOverflow.clip,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      Icons.location_on,
                                                      color: CustomColors.primary,
                                                      size: 24,
                                                    ),
                                                    Text(
                                                      widget.stationList[widget.currentIndex].name,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w500,
                                                        decoration: TextDecoration.none,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(height: 8),
                                                const Text(
                                                  "Available Rides",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    decoration: TextDecoration.none,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.of(context).size.width * 0.24,
                                                      height: 130,
                                                      padding: const EdgeInsets.only(bottom: 12, top: 16),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(16),
                                                        color: CustomColors.secondary,
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Expanded(
                                                            child: Image.asset('assets/25.png', fit: BoxFit.contain),
                                                          ),
                                                          const SizedBox(height: 8),
                                                          Text(
                                                            "${getTotalVehicle(vehicleList: widget.stationList[widget.currentIndex].vehicleList, type: "Scooter")} Scooter",
                                                            style: const TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width * 0.24,
                                                      height: 130,
                                                      padding: const EdgeInsets.only(bottom: 12, top: 16, left: 12, right: 12),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(16),
                                                        color: CustomColors.secondary,
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Expanded(
                                                            child: Image.asset('assets/102.png', fit: BoxFit.contain),
                                                          ),
                                                          const SizedBox(height: 8),
                                                          Text(
                                                            "${getTotalVehicle(vehicleList: widget.stationList[widget.currentIndex].vehicleList, type: "Bike")} Bike",
                                                            style: const TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 24),
                                  Center(
                                    child: SlidingSwitch(
                                      width: 240,
                                      height: 48,
                                      value: isBike,
                                      onChanged: (value) {
                                        setState(() {
                                          isBike = value;
                                          fetchVehicle();
                                        });
                                      },
                                      onTap: () {},
                                      onDoubleTap: () {},
                                      onSwipe: () {},
                                      textOff: "Scooter",
                                      textOn: "Bike",
                                      contentSize: 16,
                                      background: const Color(0xffB6C4D4),
                                      buttonColor: CustomColors.primary,
                                      colorOff: Colors.white,
                                      colorOn: Colors.white,
                                      inactiveColor: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  SizedBox(
                                    height: 180,
                                    child: ListView.builder(
                                      itemCount: availableVehicleList.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        Vehicle vehicle = availableVehicleList[index];

                                        return Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  Vehicle vehicle = availableVehicleList[index];
                                                  context.read<SelectedVehicleBloc>().add(SetSelectedVehicleEvent(vehicle));
                                                });
                                              },
                                              child: VehicleInfoCard(vehicle: vehicle),
                                            ),
                                            index != availableVehicleList.length - 1
                                                ? const SizedBox(width: 16)
                                                : const SizedBox(),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Row(
                                    children: [
                                      Text(
                                        "Select Rides that you want*",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Center(
                                    child: PrimaryButton(
                                      title: "Book",
                                      onTap: () async {
                                        if (state is SelectedVehicleInitial) {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                titlePadding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                                                contentPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                                                title: Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    IconButton(
                                                      icon: const Icon(Icons.close, size: 32),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                content: const Text(
                                                  "You haven't choose a vehicle!",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                          return;
                                        }

                                        SharedPreferences pref = await SharedPreferences.getInstance();

                                        if (pref.getBool("dont-show-tutorial") != null) {
                                          Navigator.pushNamed(context, '/booking');
                                          return;
                                        }

                                        Navigator.pushNamed(context, '/tutorial-booking');
                                      },
                                    ),
                                  )
                                ],
                              )
                            : Container(
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.38,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
