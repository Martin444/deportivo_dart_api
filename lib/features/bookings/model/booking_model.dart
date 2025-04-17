import 'package:deportivo_dart_api/deportivo_dart_api.dart';

class BookingModel {
  final String? id;
  final String? description;
  final String? emailAlert;
  final String? phoneAlert;
  final String? timeStart;
  final String? timeEnd;
  final String? bookingDateRequest;
  final String? state;
  final String? createAt;
  final String? updateAt;
  final UserModel? requestUser;
  final SportFacilitieModel? sportFacility;

  BookingModel({
    required this.id,
    required this.description,
    required this.emailAlert,
    this.phoneAlert,
    required this.timeStart,
    required this.timeEnd,
    required this.bookingDateRequest,
    required this.state,
    required this.createAt,
    required this.updateAt,
    required this.requestUser,
    required this.sportFacility,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] as String?,
      description: json['description'] as String?,
      emailAlert: json['emailAlert'] as String?,
      phoneAlert: json['phoneAlert'] as String?,
      timeStart: json['timeStart'] as String?,
      timeEnd: json['timeEnd'] as String?,
      bookingDateRequest: json['bookingDateRequest'] as String?,
      state: json['state'] as String?,
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
      'bookingDateRequest': bookingDateRequest,
      'state': state,
      'createAt': createAt,
      'updateAt': updateAt,
      'requestUser': requestUser?.toJson(),
      'sportFacility': sportFacility?.toJson(),
    };
  }
}
