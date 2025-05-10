import 'dart:typed_data';

import 'package:deportivo_dart_api/deportivo_dart_api.dart';

class SportFacilityBodyParam {
  final String name;
  final String type;
  final DTAddressModel location;
  final List<Uint8List> files;
  final bool isActive;
  final Map<String, bool> daysAbilables;
  final Map<String, String> startsTimesAbilables;
  final Map<String, String> endTimesAbilables;
  final List<BookingTypeBodyParams> bookingTypes;

  SportFacilityBodyParam({
    required this.name,
    required this.type,
    required this.location,
    required this.files,
    required this.isActive,
    required this.daysAbilables,
    required this.startsTimesAbilables,
    required this.endTimesAbilables,
    required this.bookingTypes,
  });
}
