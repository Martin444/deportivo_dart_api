import 'package:deportivo_dart_api/deportivo_dart_api.dart';
import 'package:deportivo_dart_api/features/bookings/data/provider/booking_provider.dart.dart';

class ConfirmBooking {
  const ConfirmBooking();
  Future<BookingModel> execute(BookingConfirmBody body) async {
    try {
      var response = await BookingProvider().confirmBooking(body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
