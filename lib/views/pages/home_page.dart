import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rollease/models/station.dart';
import 'package:rollease/utils/determine_nearest_station.dart';
import 'package:rollease/utils/determine_position.dart';
import 'package:rollease/views/widgets/sliding_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MapController _mapController = MapController();
  // final AlignOnUpdate _followOnLocationUpdate = AlignOnUpdate.always;
  // final StreamController<double?> _followCurrentLocationStreamController = StreamController<double?>();

  int currentIndex = 0;
  bool isScooter = false;
  LatLng centerLocation = const LatLng(-5.15054559580349, 119.39584494687219);

  List<Station> stationList = [
    Station(const LatLng(-5.148975720757649, 119.39523283019129), "Station UC", "Kampus UC Makassar"),
    Station(const LatLng(-5.148721772990743, 119.3978736537028), "Station Business Park", "Business Park"),
    Station(const LatLng(-5.14783518245103, 119.39559877170836), "Station Sunset Quay", "Sunset Quay"),
    Station(const LatLng(-5.149649701735801, 119.39457008849449), "Station Delft", "Apartment Delft"),
  ];

  Future<LatLng> getCurrentLocationLatLng() async {
    Position location = await determinePosition();

    return LatLng(location.latitude, location.longitude);
  }

  Future<void> initCenterLocation() async {
    centerLocation = await getCurrentLocationLatLng();

    determineNearestStation(
      stationList,
      (nearestStation) {
        for (Station station in stationList) {
          if (station.name == nearestStation["station"]) {
            setState(() {
              centerLocation = station.latLng;
              stationList.remove(station);
              stationList.insert(0, station);
              currentIndex = 0;
              _mapController.move(station.latLng, 16.5);
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
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: centerLocation,
            initialZoom: 16.5,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            // CurrentLocationLayer(
            //   alignPositionOnUpdate: _followOnLocationUpdate,
            //   alignPositionStream: _followCurrentLocationStreamController.stream,
            //   alignDirectionOnUpdate: AlignOnUpdate.never,
            //   style: const LocationMarkerStyle(
            //     marker: DefaultLocationMarker(),
            //     markerSize: Size(20, 20),
            //     markerDirection: MarkerDirection.heading,
            //   ),
            // ),
            MarkerLayer(
              markers: List.generate(
                stationList.length,
                (index) => Marker(
                  point: stationList[index].latLng,
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
                          size: 35,
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
              onPressed: () {},
              child: const Icon(
                Icons.person_outlined,
                color: Color(0xffA2C90C),
                size: 44,
              )),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: DraggableScrollableSheet(
            initialChildSize: 0.4,
            maxChildSize: 0.82,
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
                                color: const Color(0xffA2C90C),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SliverList.list(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Nearest Station",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.3,
                                              height: 240,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(16),
                                                color: const Color(0xffA2C90C),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context).size.width * 0.47,
                                                  child: Text(
                                                    stationList[currentIndex].name,
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
                                                      color: Color(0xffA2C90C),
                                                      size: 24,
                                                    ),
                                                    Text(
                                                      stationList[currentIndex].place,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
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
                                                    fontWeight: FontWeight.normal,
                                                    decoration: TextDecoration.none,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.of(context).size.width * 0.22,
                                                      height: 120,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(16),
                                                        color: const Color(0xffA2C90C),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 12),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width * 0.22,
                                                      height: 120,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(16),
                                                        color: const Color(0xffA2C90C),
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
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (currentIndex >= 3) {
                                              currentIndex = 0;
                                              centerLocation = stationList[currentIndex].latLng;
                                              _mapController.move(centerLocation, 16.5);
                                              return;
                                            }

                                            currentIndex++;
                                            centerLocation = stationList[currentIndex].latLng;
                                            _mapController.move(centerLocation, 16.5);
                                          });
                                        },
                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.16,
                                          height: 240,
                                          child: const Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.chevron_right,
                                                size: 64,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SlidingSwitch(
                                    width: 240,
                                    height: 48,
                                    value: isScooter,
                                    onChanged: (value) {
                                      isScooter = !value;
                                    },
                                    onTap: () {},
                                    onDoubleTap: () {},
                                    onSwipe: () {},
                                    textOff: "Scooter",
                                    textOn: "Bike",
                                    contentSize: 16,
                                    background: const Color(0xffB6C4D4),
                                    buttonColor: const Color(0xffA2C90C),
                                    colorOff: Colors.white,
                                    colorOn: Colors.white,
                                    inactiveColor: Colors.white,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                height: 180,
                                child: ListView.builder(
                                  itemCount: 5,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 180,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            color: const Color(0xffA2C90C),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Select Rides that you want*",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    style: const ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll<Color>(Color(0xffA2C90C)),
                                        fixedSize: MaterialStatePropertyAll<Size>(Size(176, 56))),
                                    child: const Text(
                                      "Book",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  )
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
          ),
        ),
      ],
    );
  }
}
