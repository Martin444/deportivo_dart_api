import 'package:deportivo_dart_api/features/auth/login/data/provider/login_provider.dart';
import 'package:deportivo_dart_api/features/auth/login/model/user_succes_model.dart';

class LoginSocialUserUseCase {
  LoginSocialUserUseCase();

  Future<UserSuccess> execute(
    String socialToken,
  ) async {
    try {
      var response = await LoginProvider().loginSocial(socialToken: socialToken);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
