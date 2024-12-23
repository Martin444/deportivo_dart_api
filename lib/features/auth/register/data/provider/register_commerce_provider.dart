import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:deportivo_dart_api/core/api.dart';
import 'package:deportivo_dart_api/core/exeptions/api_exception.dart';
import 'package:deportivo_dart_api/features/auth/login/model/user_succes_model.dart';
import 'package:deportivo_dart_api/features/auth/register/data/repository/register_commerce_respository.dart';
import 'package:http/http.dart' as http;

class RegisterCommerceProvider extends RegisterCommerceRespository {
  @override
  Future<UserSuccess> registerCommerce({
    required String photo,
    required String email,
    required String name,
    required String phone,
    required String role,
    required String password,
  }) async {
    try {
      Uri loginURl = Uri.parse('${API.defaulBaseUrl}/auth/register');
      var login = await http.post(
        loginURl,
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "photoURL": photo,
          "email": email,
          "name": name,
          "phone": phone,
          "password": password,
          "role": role,
          "needToChangepassword": false,
        }),
      );
      var respJson = jsonDecode(login.body);
      if (respJson['access_token'] == null) {
        throw ApiException(
          respJson['statusCode'] ?? 32,
          respJson['message'],
        );
      }
      return UserSuccess(
        accessToken: respJson['access_token'],
        needToChangePassword: respJson['needToChangePassword'],
      );
    } catch (e) {
      rethrow;
    }
  }
}
