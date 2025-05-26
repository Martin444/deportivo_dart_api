import 'package:deportivo_dart_api/deportivo_dart_api.dart';
import 'package:deportivo_dart_api/features/bookings/model/payment_intent_model.dart';
import 'package:flutter/material.dart';

class BookingModel {
  final String? id;
  final String? description;
  final String? emailAlert;
  final String? phoneAlert;
  final TimeOfDay? timeStart;
  final TimeOfDay? timeEnd;
  final DateTime? bookingDateRequest;
  final BookingStatus? state;
  final String? createAt;
  final String? updateAt;
  final UserModel? requestUser;
  final SportFacilitieModel? sportFacility;
  final PaymentIntentModel? paymentIntent;

  BookingModel({
    this.id,
    this.description,
    this.emailAlert,
    this.phoneAlert,
    this.timeStart,
    this.timeEnd,
    this.bookingDateRequest,
    this.state,
    this.createAt,
    this.updateAt,
    this.requestUser,
    this.sportFacility,
    this.paymentIntent,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] as String?,
      description: json['description'] as String?,
      emailAlert: json['emailAlert'] as String?,
      phoneAlert: json['phoneAlert'] as String?,
      timeStart: _parseTimeOfDay(json['timeStart'] as String?),
      timeEnd: _parseTimeOfDay(json['timeEnd'] as String?),
      bookingDateRequest: DateTime.tryParse(json['bookingDateRequest'] as String? ?? ''),
      state: _stringToBookingStatus(json['state'] as String?),
      createAt: json['createAt'] as String?,
      updateAt: json['updateAt'] as String?,
      requestUser: json['requestUser'] != null ? UserModel.fromJson(json['requestUser'] as Map<String, dynamic>) : null,
      sportFacility: json['sportFacility'] != null
          ? SportFacilitieModel.fromJson(json['sportFacility'] as Map<String, dynamic>)
          : null,
      paymentIntent: json['paymentIntent'] != null
          ? PaymentIntentModel.fromJson(json['paymentIntent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'emailAlert': emailAlert,
      'phoneAlert': phoneAlert,
      'timeStart': _formatTimeOfDay(timeStart),
      'timeEnd': _formatTimeOfDay(timeEnd),
      'bookingDateRequest': bookingDateRequest?.toString(),
      'state': state?.name,
      'createAt': createAt,
      'updateAt': updateAt,
      'requestUser': requestUser?.toJson(),
      'sportFacility': sportFacility?.toJson(),
    };
  }

  static BookingStatus? _stringToBookingStatus(String? status) {
    switch (status) {
      case 'pennding':
        return BookingStatus.pennding;
      case 'confirmed':
        return BookingStatus.confirmed;
      case 'canceled':
        return BookingStatus.canceled;
      default:
        return null;
    }
  }

  static TimeOfDay? _parseTimeOfDay(String? timeString) {
    if (timeString == null) return null;
    final parts = timeString.split(':');
    if (parts.length != 2) return null; // Or throw an error, depending on your needs
    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);

    if (hour == null || minute == null) return null;

    return TimeOfDay(hour: hour, minute: minute);
  }

  static String? _formatTimeOfDay(TimeOfDay? timeOfDay) {
    if (timeOfDay == null) return null;
    return '${timeOfDay.hour.toString().padLeft(2, '0')}:${timeOfDay.minute.toString().padLeft(2, '0')}';
  }
}
