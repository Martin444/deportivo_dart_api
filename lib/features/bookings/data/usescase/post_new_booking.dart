import 'package:deportivo_dart_api/deportivo_dart_api.dart';
import 'package:deportivo_dart_api/features/bookings/data/provider/booking_provider.dart.dart';

class PostNewBooking {
  const PostNewBooking();

  Future<BookingModel> execute(BookingParams params) async {
    try {
      var response = await BookingProvider().createBooking(params);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
