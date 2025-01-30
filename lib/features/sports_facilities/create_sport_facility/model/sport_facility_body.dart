import 'dart:typed_data';

class SportFacilityBodyParam {
  final String name;
  final String type;
  final String location;
  final List<Uint8List> files;
  final bool isActive;

  SportFacilityBodyParam({
    required this.name,
    required this.type,
    required this.location,
    required this.files,
    required this.isActive,
  });
}
