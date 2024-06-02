import 'package:latlong2/latlong.dart';
import 'package:rollease/models/vehicle.dart';

class Station {
  final LatLng latLng;
  final String name;
  final String place;
  final String image;
  final List<Vehicle> vehicleList;

  Station({required this.latLng, required this.name, required this.place, required this.image, required this.vehicleList});
}
