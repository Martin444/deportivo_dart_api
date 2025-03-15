import 'package:deportivo_dart_api/features/user/profiles/data/provider/dinning_provider.dart';
import 'package:deportivo_dart_api/features/user/profiles/model/user_model.dart';

class GetMeUseCase {
  GetMeUseCase();

  Future<UserModel> execute() async {
    try {
      var response = await DinningProvider().getMe();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
