import '../../../deportivo_dart_api.dart';

class PaymentIntentModel {
  final String id;
  final String transactionId;
  final String userId;
  final PaymentStatusType state;
  final double amount;

  PaymentIntentModel({
    required this.id,
    required this.transactionId,
    required this.userId,
    required this.state,
    required this.amount,
  });

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) {
    return PaymentIntentModel(
      id: json['id'] as String,
      transactionId: json['transaction_id'] as String,
      userId: json['user_id'] as String,
      state: PaymentStatusType.values.firstWhere(
        (e) => e.toString().split('.').last == json['state'],
        orElse: () => PaymentStatusType.values.first,
      ),
      amount: json['amount'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'transaction_id': transactionId,
      'user_id': userId,
      'state': state,
      'amount': amount,
    };
  }
}
