import 'package:latlong2/latlong.dart';

class Vehicle {
  final int id;
  final String name;
  final String type;
  final String imageUrl;
  final int battery;
  final bool inUse;
  final LatLng currentCoordinates;

  Vehicle({
    required this.id,
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.battery,
    required this.inUse,
    required this.currentCoordinates,
  });
}
