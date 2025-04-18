import 'package:deportivo_dart_api/deportivo_dart_api.dart';

class BookingChangeStatusBody {
  final String bookingID;
  final BookingStatus status;

  BookingChangeStatusBody({
    required this.bookingID,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'bookingID': bookingID,
      'status': status.name,
    };
  }
}
