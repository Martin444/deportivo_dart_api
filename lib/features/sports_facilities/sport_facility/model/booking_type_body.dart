import '../../../../deportivo_dart_api.dart';

class BookingTypeBodyParams {
  final BookingTypeEnum type;
  final String? description;
  final double amount;
  const BookingTypeBodyParams({
    required this.type,
    required this.amount,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'description': description,
      'amount': amount,
    };
  }
}
