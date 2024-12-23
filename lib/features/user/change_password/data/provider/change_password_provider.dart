import 'dart:convert';

import 'package:deportivo_dart_api/core/api.dart';
import 'package:deportivo_dart_api/core/exeptions/api_exception.dart';
import 'package:deportivo_dart_api/features/user/change_password/data/repository/change_password_repository.dart';
import 'package:deportivo_dart_api/features/user/change_password/model/change_password_params.dart';
import 'package:http/http.dart' as http;

class ChangePasswordProvider extends ChangePasswordRepository {
  @override
  Future<dynamic> changePassword({required ChangePasswordParams params}) async {
    try {
      Uri changeURl = Uri.parse('${API.defaulBaseUrl}/user/change-password');
      var changePassResponse = await http.post(
        changeURl,
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: params.toJson(),
      );
      if (changePassResponse.statusCode != 201) {
        throw ApiException(
          changePassResponse.statusCode,
          changePassResponse.body,
        );
      }

      var respJson = jsonDecode(changePassResponse.body);
      return respJson;
    } catch (e) {
      rethrow;
    }
  }
}
