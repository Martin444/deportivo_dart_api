import 'package:deportivo_dart_api/deportivo_dart_api.dart';
import 'package:deportivo_dart_api/features/bookings/data/provider/booking_provider.dart.dart';

class GetBooksClub {
  GetBooksClub();

  Future<List<BookingModel>> execute(BookingStatus params) async {
    try {
      var response = await BookingProvider().getAllMyBookingsClubs(params);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
