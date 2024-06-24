import 'package:latlong2/latlong.dart';
import 'package:rollease/models/vehicle.dart';

class Station {
  final int id;
  final String name;
  final LatLng coordinates;
  final String image;
  final List<Vehicle> vehicleList;

  Station({required this.id, required this.name, required this.coordinates, required this.image, required this.vehicleList});
}
