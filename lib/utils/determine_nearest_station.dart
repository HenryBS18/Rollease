part of 'utils.dart';

Future<void> determineNearestStation(List<Station> stationList, Function(Map nearestStation) function) async {
  List<Map<String, dynamic>> result = [];

  Position currentPosition = await determinePosition();

  for (Station station in stationList) {
    // Calculate distance between A and B
    double distanceInMeters = Geolocator.distanceBetween(
      currentPosition.latitude,
      currentPosition.longitude,
      station.latLng.latitude,
      station.latLng.longitude,
    );

    // Convert distance to kilometers
    double distanceInKm = distanceInMeters / 1000;

    result.add({
      'station': station.name,
      'distance': distanceInKm,
    });
  }

  Map<String, dynamic> minDistanceStation = result.reduce((currentMin, station) {
    return currentMin['distance'] < station['distance'] ? currentMin : station;
  });

  function(minDistanceStation);
}
