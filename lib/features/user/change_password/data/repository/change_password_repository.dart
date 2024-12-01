import 'package:deportivo_dart_api/features/user/change_password/model/change_password_params.dart';

abstract class ChangePasswordRepository {
  Future<dynamic> changePassword({
    required ChangePasswordParams params,
  });
}
