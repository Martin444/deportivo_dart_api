import 'package:deportivo_dart_api/deportivo_dart_api.dart';

abstract class BookingRepository {
  //Consulta la disponibilidad de horarios de un espacio
  Future<List<BookingRequestModel>> getRequestAvilableDate(String sportId);

  //Traer los detalles de una reservación
  Future<BookingModel> getBookingDetails(
    String bookingId,
    List<BookingAttributesEnum>? responseAttribute,
  );

  //Crea una reservación
  Future<BookingModel> createBooking(BookingParams params);

  //Traer reservaciones de un club
  Future<List<BookingModel>> getAllMyBookingsClubs(BookingStatus params);

  //Confirma la reservación
  Future<BookingModel> confirmBooking(BookingConfirmBody params);
}
