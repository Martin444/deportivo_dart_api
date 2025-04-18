import 'package:deportivo_dart_api/deportivo_dart_api.dart';

abstract class BookingRepository {
  //Consulta la disponibilidad de horarios de un espacio
  Future<List<BookingRequestModel>> getRequestAvilableDate(String sportId);
  //Crea una reservación
  Future<BookingModel> createBooking(BookingParams params);

  //Traer reservaciones de un club
  Future<List<BookingModel>> getAllMyBookingsClubs(BookingStatus params);

  //Actualiza el estado de una reservacion
  Future<BookingModel> setStatusBooking(BookingChangeStatusBody status);
}
