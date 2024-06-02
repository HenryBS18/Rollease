part of 'widgets.dart';

class VehicleInfoCard extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleInfoCard({Key? key, required this.vehicle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedVehicleBloc, SelectedVehicleState>(
      builder: (context, state) {
        return Container(
          width: 140,
          height: 180,
          padding: const EdgeInsets.only(bottom: 8, top: 16, left: 8, right: 8),
          decoration: BoxDecoration(
            color: CustomColors.secondary,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: (state is SelectedVehicleId)
                  ? (state.id == vehicle.id ? Colors.black : Colors.transparent)
                  : Colors.transparent,
              width: 3,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  vehicle.type == "Scooter" ? "assets/25.png" : "assets/102.png",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      vehicle.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const Text(
                        "Battery",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            "${vehicle.battery.toString()}%",
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(width: 2),
                          Image.asset("assets/Battery90.png", width: 8)
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
