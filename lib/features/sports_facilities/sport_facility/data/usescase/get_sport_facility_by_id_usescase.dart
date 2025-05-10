import 'package:deportivo_dart_api/deportivo_dart_api.dart';
import 'package:deportivo_dart_api/features/sports_facilities/sport_facility/data/provider/sport_facility_provider.dart';

class GetSportFacilityByIdUsescase {
  const GetSportFacilityByIdUsescase();

  Future<SportFacilitieModel> call(String id) async {
    return await SportFacilityProvider().getSportsFacilitiesById(id);
  }
}
