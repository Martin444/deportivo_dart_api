import 'package:deportivo_dart_api/deportivo_dart_api.dart';
import 'package:deportivo_dart_api/features/bookings/data/provider/booking_provider.dart.dart';

class PutStatusBooking {
  const PutStatusBooking();
  Future<BookingModel> execute(BookingChangeStatusBody body) async {
    try {
      var response = await BookingProvider().setStatusBooking(body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
