import 'package:deportivo_dart_api/features/auth/login/model/user_succes_model.dart';
import 'package:deportivo_dart_api/features/auth/register/data/provider/register_commerce_provider.dart';

class RegisterSociasUsescase {
  RegisterSociasUsescase();

  Future<UserSuccess> execute({
    required String photoUrl,
    required String email,
    required String name,
    required String phone,
    required String role,
    required String password,
  }) async {
    try {
      var response = await RegisterCommerceProvider().registerWithSocialToken(
        socialToken: password,
        email: email,
        name: name,
        photoUrl: photoUrl,
        role: role,
        phone: phone,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
