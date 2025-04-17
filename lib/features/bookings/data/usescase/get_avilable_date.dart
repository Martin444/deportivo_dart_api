import 'package:deportivo_dart_api/features/bookings/data/provider/booking_provider.dart.dart';
import 'package:deportivo_dart_api/features/bookings/model/booking_request_model.dart';

class GetAvilableDate {
  GetAvilableDate();

  Future<List<BookingRequestModel>> execute({required String sportId}) async {
    try {
      var response = await BookingProvider().getRequestAvilableDate(
        sportId,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
