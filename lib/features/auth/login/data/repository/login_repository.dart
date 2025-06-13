import 'package:deportivo_dart_api/features/auth/login/model/user_succes_model.dart';

abstract class LoginRepository {
  Future<UserSuccess> loginCommerce({
    required String email,
    required String password,
  });
  Future<UserSuccess> loginSocial({
    required String socialToken,
  });
}
