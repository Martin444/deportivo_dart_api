import 'package:deportivo_dart_api/deportivo_dart_api.dart';

class BookingModel {
  final String? id;
  final String? description;
  final String? emailAlert;
  final String? phoneAlert;
  final String? timeStart;
  final String? timeEnd;
  final DateTime? bookingDateRequest;
  final BookingStatus? state;
  final String? createAt;
  final String? updateAt;
  final UserModel? requestUser;
  final SportFacilitieModel? sportFacility;

  BookingModel({
    this.id,
    this.description,
    this.emailAlert,
    this.phoneAlert,
    this.timeStart,
    this.timeEnd,
    this.bookingDateRequest,
    this.state,
    this.createAt,
    this.updateAt,
    this.requestUser,
    this.sportFacility,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] as String?,
      description: json['description'] as String?,
      emailAlert: json['emailAlert'] as String?,
      phoneAlert: json['phoneAlert'] as String?,
      timeStart: json['timeStart'] as String?,
      timeEnd: json['timeEnd'] as String?,
      bookingDateRequest: DateTime.tryParse(json['bookingDateRequest'] as String? ?? ''),
      state: _stringToBookingStatus(json['state'] as String?),
      createAt: json['createAt'] as String?,
      updateAt: json['updateAt'] as String?,
      requestUser: json['requestUser'] != null ? UserModel.fromJson(json['requestUser'] as Map<String, dynamic>) : null,
      sportFacility: json['sportFacility'] != null
          ? SportFacilitieModel.fromJson(json['sportFacility'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'emailAlert': emailAlert,
      'phoneAlert': phoneAlert,
      'timeStart': timeStart,
      'timeEnd': timeEnd,
      'bookingDateRequest': bookingDateRequest?.toString(),
      'state': state?.name,
      'createAt': createAt,
      'updateAt': updateAt,
      'requestUser': requestUser?.toJson(),
      'sportFacility': sportFacility?.toJson(),
    };
  }

  static BookingStatus? _stringToBookingStatus(String? status) {
    switch (status) {
      case 'pennding':
        return BookingStatus.pennding;
      case 'confirmed':
        return BookingStatus.confirmed;
      case 'canceled':
        return BookingStatus.canceled;
      default:
        return null;
    }
  }
}
