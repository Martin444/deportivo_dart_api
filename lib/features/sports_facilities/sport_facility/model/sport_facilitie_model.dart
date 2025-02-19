import 'package:deportivo_dart_api/deportivo_dart_api.dart';

class SportFacilitieModel {
  String name;
  String type;
  DTAddressModel location;
  DaysAbilables daysAbilables;
  Map<String, dynamic> startsTimesAbilables;
  Map<String, dynamic> endTimesAbilables;
  String userOwner;
  bool isActive;
  List<Photo> photos;
  String id;
  DateTime createdAt;
  DateTime updatedAt;

  SportFacilitieModel({
    required this.name,
    required this.type,
    required this.location,
    required this.daysAbilables,
    required this.startsTimesAbilables,
    required this.endTimesAbilables,
    required this.userOwner,
    required this.isActive,
    required this.photos,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SportFacilitieModel.fromJson(Map<String, dynamic> json) {
    return SportFacilitieModel(
      name: json['name'],
      type: json['type'],
      location: DTAddressModel.fromJson(json['location']),
      daysAbilables: DaysAbilables.fromJson(json['daysAbilables']),
      startsTimesAbilables: json['startsTimesAbilables'],
      endTimesAbilables: json['endTimesAbilables'],
      userOwner: json['userOwner'],
      isActive: json['isActive'],
      photos: List<Photo>.from(json['photos'].map((photo) => Photo.fromJson(photo))),
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'location': location.toJson(),
      'daysAbilables': daysAbilables.toJson(),
      'startsTimesAbilables': startsTimesAbilables,
      'endTimesAbilables': endTimesAbilables,
      'userOwner': userOwner,
      'isActive': isActive,
      'photos': List<dynamic>.from(photos.map((photo) => photo.toJson())),
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
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
      lunes: json['Lunes'],
      martes: json['Martes'],
      miercoles: json['Miércoles'],
      jueves: json['Jueves'],
      viernes: json['Viernes'],
      sabado: json['Sábado'],
      domingo: json['Domingo'],
    );
  }

  Map<String, dynamic> toJson() {
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
