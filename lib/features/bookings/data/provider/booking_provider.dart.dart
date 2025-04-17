import 'dart:convert';

import 'package:deportivo_dart_api/deportivo_dart_api.dart';
import 'package:deportivo_dart_api/features/bookings/data/repository/booking_repository.dart';
import 'package:deportivo_dart_api/features/bookings/model/booking_request_model.dart';
import 'package:http/http.dart' as http;

class BookingProvider extends BookingRepository {
  @override
  Future<List<BookingRequestModel>> getRequestAvilableDate(String sportId) async {
    try {
      Uri userURl = Uri.parse('${API.defaulBaseUrl}/booking/sport-facility/request/$sportId');
      var response = await http.get(
        headers: {'Authorization': 'Bearer ${API.loginAccessToken}'},
        userURl,
      );
      if (response.statusCode != 200) {
        throw ApiException(
          response.statusCode,
          response.body,
        );
      }

      var respJson = jsonDecode(response.body) as List;

      // Verificar si respJson está vacío
      if (respJson.isEmpty) {
        return [];
      }
      // Convertir la respuesta JSON a una lista de SportFacilitieModel
      List<BookingRequestModel> sportsFinded = respJson.map((json) {
        var sportFacility = BookingRequestModel.fromJson(json);
        return sportFacility;
      }).toList();

      return sportsFinded;
    } catch (e) {
      rethrow;
    }
  }
}
