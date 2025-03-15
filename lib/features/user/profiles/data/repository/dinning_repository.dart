import 'package:deportivo_dart_api/features/user/profiles/model/user_model.dart';

abstract class DinningRepository {
  Future<UserModel> getMe();
  Future<List<UserModel>> getClubes();
}
