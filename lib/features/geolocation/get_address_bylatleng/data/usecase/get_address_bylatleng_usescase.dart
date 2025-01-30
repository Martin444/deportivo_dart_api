import 'package:deportivo_dart_api/features/geolocation/get_address_bylatleng/data/provider/get_address_bylatleng_provider.dart';
import 'package:deportivo_dart_api/features/geolocation/get_address_bylatleng/model/dt_address_model.dart';

class GetAddressBylatlengUsescase {
  Future<DTAddressModel> getAddressLatLng({
    double? lat,
    double? lon,
  }) async {
    return await GetAddressBylatlengProvider().getAddressByLatLong(
      lat,
      lon,
    );
  }
}
