import 'dart:convert';

import 'package:deportivo_dart_api/deportivo_dart_api.dart';
import 'package:deportivo_dart_api/features/bookings/data/repository/booking_repository.dart';
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

  @override
  Future<BookingModel> createBooking(BookingParams params) async {
    try {
      Uri bookingURl = Uri.parse('${API.defaulBaseUrl}/booking/sport-facility');
      var response = await http.post(
        bookingURl,
        headers: {
          'Authorization': 'Bearer ${API.loginAccessToken}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(params.toJson()),
      );
      if (response.statusCode != 201) {
        var resperrJson = jsonDecode(response.body);
        throw ApiException(
          response.statusCode,
          resperrJson['message'],
        );
      }
      var respJson = jsonDecode(response.body);
      return BookingModel.fromJson(respJson);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<BookingModel>> getAllMyBookingsClubs(BookingStatus params) async {
    try {
      Uri userURl = Uri.parse(
          '${API.defaulBaseUrl}/booking/sport-facility/club-owner?responseAttribute=requestUser,sportFacility,paymentIntent&status=${params.name}');
      var response = await http.get(
        headers: {'Authorization': 'Bearer ${API.loginAccessToken}'},
        userURl,
      );
      if (response.statusCode != 200) {
        var resperrJson = jsonDecode(response.body);
        throw ApiException(
          response.statusCode,
          resperrJson['message'],
        );
      }

      var respJson = jsonDecode(response.body) as List;

      // Verificar si respJson está vacío
      if (respJson.isEmpty) {
        return [];
      }
      // Convertir la respuesta JSON a una lista de SportFacilitieModel
      List<BookingModel> sportsFinded = respJson.map((json) {
        var sportFacility = BookingModel.fromJson(json);
        return sportFacility;
      }).toList();

      return sportsFinded;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BookingModel> confirmBooking(BookingConfirmBody params) async {
    try {
      Uri bookingURl = Uri.parse('${API.defaulBaseUrl}/booking/sport-facility/confirm');
      var response = await http.put(
        bookingURl,
        headers: {
          'Authorization': 'Bearer ${API.loginAccessToken}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(params.toJson()),
      );
      if (response.statusCode != 200) {
        throw ApiException(
          response.statusCode,
          response.body,
        );
      }
      var respJson = jsonDecode(response.body);
      return BookingModel.fromJson(respJson);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BookingModel> getBookingDetails(
    String bookingId,
    List<BookingAttributesEnum>? responseAttribute,
  ) async {
    try {
      final attributes = responseAttribute?.map((e) => e.name).join(',') ?? '';
      Uri bookingURl = Uri.parse('${API.defaulBaseUrl}/booking/detail/$bookingId'
          '${attributes.isNotEmpty ? '?responseAttribute=$attributes' : ''}');
      var response = await http.get(
        // headers: {'Authorization': 'Bearer ${API.loginAccessToken}'},
        bookingURl,
      );
      if (response.statusCode != 200) {
        throw ApiException(
          response.statusCode,
          response.body,
        );
      }
      var respJson = jsonDecode(response.body);
      return BookingModel.fromJson(respJson);
    } catch (e) {
      rethrow;
    }
  }
}
