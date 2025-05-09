import 'dart:convert';

class BookingType {
  final String? id;
  final String type;
  final String description;
  final double amount;
  final DateTime? createAt;
  final DateTime? updateAt;

  BookingType({
    this.id,
    required this.type,
    required this.description,
    required this.amount,
    this.createAt,
    this.updateAt,
  });

  // Método para convertir un mapa en una instancia de BookingType
  factory BookingType.fromMap(Map<String, dynamic> map) {
    return BookingType(
      id: map['id'] ?? '',
      type: map['type'] ?? '',
      description: map['description'] ?? '',
      amount: (map['amount'] ?? 0.0).toDouble(),
      createAt: DateTime.tryParse(map['createAt'] ?? '') ?? DateTime.now(),
      updateAt: DateTime.tryParse(map['updateAt'] ?? '') ?? DateTime.now(),
    );
  }

  // Método para convertir una instancia de BookingType en un mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'description': description,
      'amount': amount,
      'createAt': createAt?.toIso8601String(),
      'updateAt': updateAt?.toIso8601String(),
    };
  }

  // Método para convertir un JSON en una instancia de BookingType
  factory BookingType.fromJson(String source) => BookingType.fromMap(json.decode(source));

  // Método para convertir una instancia de BookingType en JSON
  String toJson() => json.encode(toMap());

  // Props para igualdad y comparación
  List<Object> get props => [id!, type, description, amount, createAt!, updateAt!];

  @override
  String toString() {
    return 'BookingType(id: $id, type: $type, description: $description, amount: $amount, createAt: $createAt, updateAt: $updateAt)';
  }
}
