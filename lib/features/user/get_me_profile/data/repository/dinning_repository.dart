import 'package:deportivo_dart_api/features/user/get_me_profile/model/dinning_model.dart';

abstract class DinningRepository {
  Future<DinningModel> getMe();
}
