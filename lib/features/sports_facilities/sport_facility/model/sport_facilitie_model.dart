import 'package:deportivo_dart_api/deportivo_dart_api.dart';
import 'package:flutter/material.dart';

class SportFacilitieModel {
  String? id;
  String? name;
  String? type;
  DTAddressModel? location;
  DaysAbilables? daysAbilables;
  Map<String, TimeOfDay>? startsTimesAbilables;
  Map<String, TimeOfDay>? endTimesAbilables;
  UserModel? userOwner;
  bool? isActive;
  List<Photo>? photos;
  DateTime? createdAt;
  DateTime? updatedAt;

  SportFacilitieModel({
    required this.name,
    required this.type,
    this.location,
    this.daysAbilables,
    this.startsTimesAbilables,
    this.endTimesAbilables,
    this.userOwner,
    this.isActive,
    this.photos,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory SportFacilitieModel.fromJson(Map<String, dynamic> json) {
    return SportFacilitieModel(
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      location: json['location'] == null ? null : DTAddressModel.fromJson(json['location']),
      daysAbilables: json['daysAbilables'] == null ? null : DaysAbilables.fromJson(json['daysAbilables']),
      startsTimesAbilables: json['startsTimesAbilables'] == null
          ? null
          : (json['startsTimesAbilables'] as Map<String, dynamic>).map(
              (key, value) => MapEntry(key, _timeOfDayFromString(value)),
            ),
      endTimesAbilables: json['endTimesAbilables'] == null
          ? null
          : (json['endTimesAbilables'] as Map<String, dynamic>).map(
              (key, value) => MapEntry(key, _timeOfDayFromString(value)),
            ),
      userOwner: json['userOwner'] == null ? null : UserModel.fromJson(json['userOwner']),
      isActive: json['isActive'] == null ? null : json['isActive'] as bool,
      photos: json['photos'] == null ? null : List<Photo>.from(json['photos'].map((photo) => Photo.fromJson(photo))),
      id: json['id'] ?? '',
      createdAt: json['createdAt'] == null ? null : DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] == null ? null : DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'location': location?.toJson(),
      'daysAbilables': daysAbilables?.toJson(),
      'startsTimesDisponibles': startsTimesAbilables?.map(
        (key, value) => MapEntry(key, _timeOfDayToString(value)),
      ),
      'endTimesAbilables': endTimesAbilables?.map(
        (key, value) => MapEntry(key, _timeOfDayToString(value)),
      ),
      'userOwner': userOwner,
      'isActive': isActive,
      'photos': photos != null ? List<dynamic>.from(photos!.map((photo) => photo.toJson())) : '',
      'id': id,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  static TimeOfDay _timeOfDayFromString(String time) {
    final parts = time.split(":");
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  static String _timeOfDayToString(TimeOfDay time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }
}

class DaysAbilables {
  bool lunes;
  bool martes;
  bool miercoles;
  bool jueves;
  bool viernes;
  bool sabado;
  bool domingo;

  DaysAbilables({
    required this.lunes,
    required this.martes,
    required this.miercoles,
    required this.jueves,
    required this.viernes,
    required this.sabado,
    required this.domingo,
  });

  factory DaysAbilables.fromJson(Map<String, dynamic> json) {
    return DaysAbilables(
      lunes: json['Lunes'] as bool,
      martes: json['Martes'] as bool,
      miercoles: json['Miércoles'] as bool,
      jueves: json['Jueves'] as bool,
      viernes: json['Viernes'] as bool,
      sabado: json['Sábado'] as bool,
      domingo: json['Domingo'] as bool,
    );
  }

  Map<String, bool> toJson() {
    return {
      'Lunes': lunes,
      'Martes': martes,
      'Miércoles': miercoles,
      'Jueves': jueves,
      'Viernes': viernes,
      'Sábado': sabado,
      'Domingo': domingo,
    };
  }
}

class Photo {
  String publicId;
  String name;
  String photoURL;
  String id;

  Photo({
    required this.publicId,
    required this.name,
    required this.photoURL,
    required this.id,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      publicId: json['publicId'],
      name: json['name'],
      photoURL: json['photoURL'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'publicId': publicId,
      'name': name,
      'photoURL': photoURL,
      'id': id,
    };
  }
}
