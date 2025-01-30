import 'package:deportivo_dart_api/features/geolocation/get_address_bylatleng/model/dt_address_model.dart';

abstract class GetAddressBylatlengRepository {
  Future<DTAddressModel> getAddressByLatLong(double lat, double lon);
}
