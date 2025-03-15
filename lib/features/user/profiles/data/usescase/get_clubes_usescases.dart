import 'package:deportivo_dart_api/features/user/profiles/data/provider/dinning_provider.dart';

import '../../model/user_model.dart';

class GetClubesUsescases {
  GetClubesUsescases();

  Future<List<UserModel>> execute() async {
    try {
      var response = await DinningProvider().getClubes();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
