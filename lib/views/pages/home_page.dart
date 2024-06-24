part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MapController _mapController = MapController();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  final AlignOnUpdate _followOnLocationUpdate = AlignOnUpdate.once;
  final StreamController<double?> _followCurrentLocationStreamController = StreamController<double?>();

  int currentIndex = 0;
  LatLng centerLocation = const LatLng(-5.15054559580349, 119.39584494687219);

  List<Station> stationList = [];

  Future<LatLng> getCurrentLocationLatLng() async {
    Position location = await determinePosition();

    return LatLng(location.latitude, location.longitude);
  }

  Future<void> initCenterLocation() async {
    centerLocation = await getCurrentLocationLatLng();
    stationList = await StationService().getAll();

    determineNearestStation(
      stationList,
      (nearestStation) {
        for (Station station in stationList) {
          if (station.name == nearestStation["station"]) {
            setState(() {
              centerLocation = station.coordinates;
              stationList.remove(station);
              stationList.insert(0, station);
              currentIndex = 0;
              _mapController.move(station.coordinates, 16.5);
              context.read<CurrentStationBloc>().add(AddCurrentStationEvent(stationList[0]));
            });
          }
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();

    initCenterLocation();
    context.read<AuthBloc>().add(FetchUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      drawer: const Sidebar(),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: centerLocation,
              initialZoom: 16.8,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              CurrentLocationLayer(
                alignPositionOnUpdate: _followOnLocationUpdate,
                alignPositionStream: _followCurrentLocationStreamController.stream,
                alignDirectionOnUpdate: AlignOnUpdate.never,
                style: const LocationMarkerStyle(
                  marker: DefaultLocationMarker(),
                  markerSize: Size(20, 20),
                  markerDirection: MarkerDirection.heading,
                ),
              ),
              MarkerLayer(
                markers: List.generate(
                  stationList.length,
                  (index) => Marker(
                    point: stationList[index].coordinates,
                    width: 135,
                    height: 105,
                    rotate: true,
                    child: GestureDetector(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 32,
                          ),
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(200, 238, 238, 238),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                              stationList[index].name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                overflow: TextOverflow.clip,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 64,
            left: 24,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                _scaffoldState.currentState?.openDrawer();
              },
              child: const Icon(
                Icons.person_outlined,
                color: CustomColors.primary,
                size: 44,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: BlocBuilder<ModeBloc, ModeState>(
              builder: (context, state) {
                if (state is BookingMode) {
                  return const BookingModeBottomSheet();
                }

                return NormalModeBottomSheet(stationList: stationList, currentIndex: currentIndex);
              },
            ),
          ),
        ],
      ),
    );
  }
}
