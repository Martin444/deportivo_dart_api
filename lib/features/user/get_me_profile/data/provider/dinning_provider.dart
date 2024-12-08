import 'dart:convert';

import 'package:deportivo_dart_api/core/api.dart';
import 'package:deportivo_dart_api/core/exeptions/api_exception.dart';
import 'package:deportivo_dart_api/features/user/get_me_profile/data/repository/dinning_repository.dart';
import 'package:deportivo_dart_api/features/user/get_me_profile/model/user_model.dart';
import 'package:http/http.dart' as http;

class DinningProvider extends DinningRepository {
  @override
  Future<UserModel> getMe() async {
    try {
      Uri userURl = Uri.parse('${API.defaulBaseUrl}/user/me');
      var response = await http.get(
        headers: {'Authorization': 'Bearer ${API.loginAccessToken}'},
        userURl,
      );
      if (response.statusCode != 200) {
        throw ApiException(
          response.statusCode,
          response.body,
        );
      }
      var respJson = jsonDecode(response.body);

      return UserModel.fromJson(respJson);
    } catch (e) {
      rethrow;
    }
  }
}
