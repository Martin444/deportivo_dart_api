import 'package:flutter/material.dart';

class BookingParams {
  final String sportFacilityID;
  final String description;
  final String emailAlert;
  final String? phoneAlert;
  final TimeOfDay timeStart;
  final TimeOfDay timeEnd;
  final DateTime bookingDateRequest;

  BookingParams({
    required this.sportFacilityID,
    required this.description,
    required this.emailAlert,
    this.phoneAlert,
    required this.timeStart,
    required this.timeEnd,
    required this.bookingDateRequest,
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
    };
  }
}
