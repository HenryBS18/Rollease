import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:rollease/models/station.dart';
import 'package:rollease/models/vehicle.dart';

part 'station_event.dart';
part 'station_state.dart';

class StationBloc extends Bloc<StationEvent, StationState> {
  StationBloc() : super(StationInitial()) {
    on<AddStationListEvent>((event, emit) {
      emit(StationList(stationList));
    });
  }
}

List<Vehicle> vehicleList = [
  Vehicle(id: 1, name: "Scooter A", type: "Scooter", inUse: false, battery: 100),
  Vehicle(id: 2, name: "Scooter B", type: "Scooter", inUse: false, battery: 80),
  Vehicle(id: 3, name: "Bike A", type: "Bike", inUse: false, battery: 93),
  Vehicle(id: 4, name: "Bike B", type: "Bike", inUse: false, battery: 32),
  Vehicle(id: 5, name: "Bike C", type: "Bike", inUse: false, battery: 25),
  Vehicle(id: 6, name: "Bike D", type: "Bike", inUse: false, battery: 84),
];

List<Station> stationList = [
  Station(
    latLng: const LatLng(-5.14897, 119.39504),
    name: "Station UC",
    place: "Kampus UC Makassar",
    image: "assets/station image.png",
    vehicleList: vehicleList,
  ),
  Station(
    latLng: const LatLng(-5.14876, 119.39798),
    name: "Station Business Park",
    place: "Business Park",
    image: "assets/station image.png",
    vehicleList: vehicleList,
  ),
  Station(
    latLng: const LatLng(-5.14898, 119.39422),
    name: "Station Sunset Quay A",
    place: "Sunset Quay A",
    image: "assets/station image.png",
    vehicleList: vehicleList,
  ),
  Station(
    latLng: const LatLng(-5.14776, 119.39572),
    name: "Station Sunset Quay B",
    place: "Sunset Quay B",
    image: "assets/station image.png",
    vehicleList: vehicleList,
  ),
  Station(
    latLng: const LatLng(-5.14975, 119.39455),
    name: "Station Delft",
    place: "Apartment Delft",
    image: "assets/station image.png",
    vehicleList: vehicleList,
  ),
  Station(
    latLng: const LatLng(-5.14841, 119.39807),
    name: "Station HW",
    place: "W Super Club",
    image: "assets/station image.png",
    vehicleList: vehicleList,
  )
];
