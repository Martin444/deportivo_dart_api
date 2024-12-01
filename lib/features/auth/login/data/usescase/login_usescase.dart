import 'package:deportivo_dart_api/features/auth/login/data/provider/login_provider.dart';
import 'package:deportivo_dart_api/features/auth/login/model/user_succes_model.dart';

class LoginUserUseCase {
  LoginUserUseCase();

  Future<UserSuccess> execute(
    String email,
    String password,
  ) async {
    try {
      var response = await LoginProvider().loginCommerce(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
