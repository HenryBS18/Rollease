import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:rollease/models/station.dart';
import 'package:rollease/models/vehicle.dart';

const baseUrl = "https://1wxrvfs6-3000.asse.devtunnels.ms";

class StationService {
  Future<List<Station>> getAll() async {
    var uri = Uri.parse("$baseUrl/api/station");
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> rawStationList = jsonDecode(response.body)['station'];
      List<Station> stationList = [];

      for (var rawStation in rawStationList) {
        List<Vehicle> vehicleList = [];

        List<dynamic> rawVehicleList = rawStation['vehicleList'];

        for (var rawVehicle in rawVehicleList) {
          vehicleList.add(Vehicle(
            id: rawVehicle['id'],
            name: rawVehicle['name'],
            type: rawVehicle['type'],
            imageUrl: rawVehicle['imageUrl'],
            battery: rawVehicle['battery'],
            inUse: rawVehicle['inUse'],
            currentCoordinates:
                LatLng(rawVehicle['currentCoordinates']['latitude'], rawVehicle['currentCoordinates']['longitude']),
          ));
        }

        stationList.add(Station(
          id: rawStation['id'],
          name: rawStation['name'],
          coordinates: LatLng(rawStation['coordinates']['latitude'], rawStation['coordinates']['longitude']),
          image: rawStation['imageUrl'],
          vehicleList: vehicleList,
        ));
      }

      return stationList;
    }
    return [];
  }
}
