import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingRequestModel {
  final DateTime? date;
  final String? dayName;
  final TimeOfDay? openTime;
  final TimeOfDay? closeTime;
  final bool? enable;
  final List<dynamic>? bookings;

  BookingRequestModel({
    required this.date,
    required this.dayName,
    required this.openTime,
    required this.closeTime,
    required this.enable,
    required this.bookings,
  });

  factory BookingRequestModel.fromJson(Map<String, dynamic> json) {
    return BookingRequestModel(
      date: json['date'] != null ? DateFormat('yyyy-MM-dd').parse(json['date'] as String) : null,
      dayName: json['dayName'] as String?,
      openTime: _parseTimeOfDay(json['openTime'] as String?),
      closeTime: _parseTimeOfDay(json['closeTime'] as String?),
      enable: json['enable'] as bool?,
      bookings: json['bookings'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date?.toIso8601String(),
      'dayName': dayName,
      'openTime': _formatTimeOfDay(openTime),
      'closeTime': _formatTimeOfDay(closeTime),
      'bookings': bookings,
    };
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
