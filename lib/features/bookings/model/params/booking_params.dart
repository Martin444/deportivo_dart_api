import 'package:flutter/material.dart';

import '../booking_type_body.dart';

class BookingParams {
  final String sportFacilityID;
  final String description;
  final String emailAlert;
  final String? phoneAlert;
  final TimeOfDay timeStart;
  final TimeOfDay timeEnd;
  final DateTime bookingDateRequest;
  final BookingTypeBodyParams bookingType;

  BookingParams({
    required this.sportFacilityID,
    required this.description,
    required this.emailAlert,
    this.phoneAlert,
    required this.timeStart,
    required this.timeEnd,
    required this.bookingDateRequest,
    required this.bookingType,
  });

  Map<String, dynamic> toJson() {
    return {
      "sportFacilityID": sportFacilityID,
      "description": description,
      "emailAlert": emailAlert,
      "phoneAlert": phoneAlert,
      "timeStart": "${timeStart.hour.toString().padLeft(2, '0')}:${timeStart.minute.toString().padLeft(2, '0')}",
      "timeEnd": "${timeEnd.hour.toString().padLeft(2, '0')}:${timeEnd.minute.toString().padLeft(2, '0')}",
      "bookingDateRequest": bookingDateRequest.toUtc().toIso8601String(),
      "booking_types": bookingType.toJson(),
    };
  }
}
