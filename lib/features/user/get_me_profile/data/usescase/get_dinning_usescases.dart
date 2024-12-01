import 'package:deportivo_dart_api/features/user/get_me_profile/data/provider/dinning_provider.dart';
import 'package:deportivo_dart_api/features/user/get_me_profile/model/dinning_model.dart';

class GetDinningUseCase {
  GetDinningUseCase();

  Future<DinningModel> execute() async {
    try {
      var response = await DinningProvider().getMe();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
