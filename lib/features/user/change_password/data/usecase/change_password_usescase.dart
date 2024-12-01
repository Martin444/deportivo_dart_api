import 'package:deportivo_dart_api/features/user/change_password/data/provider/change_password_provider.dart';
import 'package:deportivo_dart_api/features/user/change_password/model/change_password_params.dart';

class ChangePasswordUseCase {
  ChangePasswordUseCase();

  Future<dynamic> execute(
    ChangePasswordParams newPass,
  ) async {
    try {
      var response = await ChangePasswordProvider().changePassword(
        params: newPass,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
