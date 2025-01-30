import 'dart:convert';

import 'package:deportivo_dart_api/core/api.dart';
import 'package:deportivo_dart_api/features/geolocation/get_address_bylatleng/data/repository/get_address_bylatleng_repository.dart';
import 'package:deportivo_dart_api/features/geolocation/get_address_bylatleng/model/dt_address_model.dart';

import 'package:http/http.dart' as http;

class GetAddressBylatlengProvider extends GetAddressBylatlengRepository {
  @override
  Future<DTAddressModel> getAddressByLatLong(double? lat, double? lon) async {
    final response = await http.get(
      Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lon&key=${API.googleAPIKEY}'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data['status'] == 'OK') {
        return DTAddressModel.fromGoogleMaps(data['results'][0]);
      } else {
        throw Exception('Failed to get address');
      }
    } else {
      throw Exception('Failed to load data from Google Maps API');
    }
  }
}
