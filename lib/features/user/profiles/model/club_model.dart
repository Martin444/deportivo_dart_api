import 'package:deportivo_dart_api/deportivo_dart_api.dart';

class ClubModel {
  String? id;
  String? photoURL;
  String? name;
  String? description;
  String? email;
  String? phone;
  String? password;
  String? role;
  DateTime? createAt;
  DateTime? updateAt;
  List<SportFacilitieModel>? sportFacilities;

  ClubModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.role,
    this.createAt,
    this.updateAt,
    this.photoURL,
    this.sportFacilities,
  });

  static ClubModel fromJson(Map<String, dynamic> json) {
    return ClubModel(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Sin nombre', // Asigna un valor por defecto si es nulo
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      photoURL: json['photoURL'] ?? '',
      role: json['role'] ?? '',
      createAt: json['createAt'] == null
          ? null
          : DateTime.parse(json['createAt']), // Evita llamar a DateTime.parse si es nulo
      updateAt: json['updateAt'] == null ? null : DateTime.parse(json['updateAt']),
      sportFacilities: json['sportFacilities'] == null
          ? null
          : (json['sportFacilities'] as List<dynamic>)
              .map((item) => SportFacilitieModel.fromJson(item as Map<String, dynamic>))
              .toList(),
    );
  }

  static List<ClubModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ClubModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'photoURL': photoURL,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
      'createAt': createAt?..toIso8601String(),
      'updateAt': updateAt?.toIso8601String(),
      'sportFacilities': sportFacilities?.map((facility) => facility.toJson()).toList(),
    };
  }
}
