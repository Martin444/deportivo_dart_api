import 'package:deportivo_dart_api/features/sports_facilities/sport_facility/model/sport_facilitie_model.dart';

import '../provider/sport_facility_provider.dart';

class GetAllSportsFacilitiesUsescase {
  GetAllSportsFacilitiesUsescase();

  Future<List<SportFacilitieModel>> execute() async {
    try {
      var response = await SportFacilityProvider().getAllSportsFacilities();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
