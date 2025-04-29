class BookingConfirmBody {
  final String bookingID;

  BookingConfirmBody({
    required this.bookingID,
  });

  Map<String, dynamic> toJson() {
    return {
      'bookingID': bookingID,
    };
  }
}
