import 'package:deportivo_dart_api/deportivo_dart_api.dart';
import 'package:deportivo_dart_api/features/bookings/data/provider/booking_provider.dart.dart';

class GetBookingById {
  GetBookingById();

  Future<BookingModel> execute({required String id, List<BookingAttributesEnum>? attributes}) async {
    try {
      var response = await BookingProvider().getBookingDetails(id, attributes);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
