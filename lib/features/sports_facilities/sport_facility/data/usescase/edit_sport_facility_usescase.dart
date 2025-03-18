import 'package:deportivo_dart_api/features/sports_facilities/sport_facility/data/provider/sport_facility_provider.dart';

import '../../../../../deportivo_dart_api.dart';

class EditSportFacilityUsescase {
  EditSportFacilityUsescase();
  Future<String> execute({required String id, required SportFacilityBodyParam parms}) async {
    try {
      var response = await SportFacilityProvider().editSportsFacilitiesById(
        id,
        parms,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
