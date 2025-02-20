import 'package:deportivo_dart_api/features/sports_facilities/sport_facility/data/provider/sport_facility_provider.dart';
import 'package:deportivo_dart_api/features/sports_facilities/sport_facility/model/sport_facility_body.dart';

class SportFacilityUsescase {
  SportFacilityUsescase();

  Future<String> execute(SportFacilityBodyParam parms) async {
    try {
      var response = await SportFacilityProvider().registerSportFacility(
        parms,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
