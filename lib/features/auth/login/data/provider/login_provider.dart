import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:deportivo_dart_api/core/api.dart';
import 'package:deportivo_dart_api/core/exeptions/api_exception.dart';
import 'package:deportivo_dart_api/features/auth/login/data/repository/login_repository.dart';
import 'package:deportivo_dart_api/features/auth/login/model/user_succes_model.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends LoginRepository {
  @override
  Future<UserSuccess> loginCommerce({
    required String email,
    required String password,
  }) async {
    try {
      Uri loginURl = Uri.parse('${API.defaulBaseUrl}/auth/login');
      var login = await http.post(
        loginURl,
        body: {
          "email": email,
          "password": password,
        },
      );
      if (login.statusCode != 201) {
        var respJson = jsonDecode(login.body);
        throw ApiException(
          login.statusCode,
          respJson['message'],
        );
      }
      var respJson = jsonDecode(login.body);
      API.setAccessToken(respJson['access_token']);
      return UserSuccess(
        accessToken: respJson['access_token'],
        needToChangePassword: respJson['needToChangePassword'],
      );
    } catch (e) {
      rethrow;
    }
  }
}
