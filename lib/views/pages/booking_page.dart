part of 'pages.dart';

class DurationCost {
  final String duration;
  final int cost;

  DurationCost({required this.duration, required this.cost});
}

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final List<DurationCost> durationCostList = [
    DurationCost(duration: '15 minutes', cost: 5000),
    DurationCost(duration: '30 minutes', cost: 10000),
    DurationCost(duration: '45 minutes', cost: 15000),
    DurationCost(duration: '1 hour', cost: 20000),
  ];

  final List<String> rentTypes = ['Argo', 'Duration'];

  String? _selectedRentType;
  String? _selectedDuration;

  @override
  void initState() {
    _selectedRentType = rentTypes[0];
    _selectedDuration = durationCostList[0].duration;
    super.initState();
  }

  int getCostForSelectedDuration() {
    return durationCostList.firstWhere((dc) => dc.duration == _selectedDuration).cost;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedVehicleBloc, SelectedVehicleState>(
      builder: (contextSelectedVehicle, selectedVehicleState) {
        return BlocBuilder<CurrentStationBloc, CurrentStationState>(
          builder: (contextCurrentStation, currentStationState) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_sharp,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 140,
                          height: 180,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: CustomColors.secondary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  (selectedVehicleState is SelectedVehicle)
                                      ? (selectedVehicleState.vehicle.type == "Scooter" ? "assets/25.png" : "assets/102.png")
                                      : "assets/102.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (selectedVehicleState is SelectedVehicle) ? selectedVehicleState.vehicle.name : '',
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                (currentStationState is CurrentStation) ? currentStationState.station.name : '',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.location_on_sharp,
                                    color: CustomColors.primary,
                                  ),
                                  Text(
                                    (currentStationState is CurrentStation) ? 'Station ${currentStationState.station.name}' : '',
                                    style: const TextStyle(
                                      color: CustomColors.primary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                "Battery",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    "${(selectedVehicleState is SelectedVehicle) ? selectedVehicleState.vehicle.battery : ''}%",
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 3),
                                  Image.asset("assets/Battery90.png")
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      "Type of Rent",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Color(0xFFA2C90C), width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Color(0xFFA2C90C), width: 2.0),
                        ),
                      ),
                      value: _selectedRentType,
                      items: rentTypes.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: SizedBox(
                            width: 200,
                            child: Text(value),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRentType = newValue!;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      child: _selectedRentType == 'Argo'
                          ? const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Cost",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Rp 300/meter",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: CustomColors.primary,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: 200),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Duration",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      borderSide: BorderSide(color: Color(0xFFA2C90C), width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      borderSide: BorderSide(color: Color(0xFFA2C90C), width: 2.0),
                                    ),
                                  ),
                                  value: _selectedDuration,
                                  items: durationCostList.map((DurationCost value) {
                                    return DropdownMenuItem<String>(
                                      value: value.duration,
                                      child: SizedBox(
                                        width: 200,
                                        child: Text(value.duration),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedDuration = newValue!;
                                    });
                                  },
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  "Cost",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Rp ${getCostForSelectedDuration()}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: CustomColors.primary,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(height: 94),
                              ],
                            ),
                    ),
                    Center(
                      child: PrimaryButton(
                        title: "Book",
                        onTap: () {
                          Navigator.pushNamed(context, '/scan');
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
