import 'package:deportivo_dart_api/features/user/get_me_profile/model/user_model.dart';

abstract class DinningRepository {
  Future<UserModel> getMe();
}
