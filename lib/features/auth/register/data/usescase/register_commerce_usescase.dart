import 'package:deportivo_dart_api/features/auth/login/model/user_succes_model.dart';
import 'package:deportivo_dart_api/features/auth/register/data/provider/register_commerce_provider.dart';
import 'package:flutter/services.dart';

class RegisterCommerceUsescase {
  RegisterCommerceUsescase();

  Future<UserSuccess> execute({
    required Uint8List photo,
    required String email,
    required String name,
    required String phone,
    required String role,
    required String password,
  }) async {
    try {
      var response = await RegisterCommerceProvider().registerCommerce(
        photo: photo,
        email: email,
        name: name,
        password: password,
        role: role,
        phone: phone,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
