import 'package:deportivo_dart_api/deportivo_dart_api.dart';

abstract class BookingRepository {
  //Consulta la disponibilidad de horarios de un espacio
  Future<List<BookingRequestModel>> getRequestAvilableDate(String sportId);
  //Crea una reservación
  Future<BookingModel> createBooking(BookingParams params);
}
