import 'package:deportivo_dart_api/features/bookings/model/booking_request_model.dart';

abstract class BookingRepository {
  Future<List<BookingRequestModel>> getRequestAvilableDate(String sportId);
}
