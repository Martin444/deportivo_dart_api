import '../provider/sport_facility_provider.dart';

class DeleteByIdSportFacilityUsescase {
  DeleteByIdSportFacilityUsescase();

  Future<String> execute(String id) async {
    try {
      var response = await SportFacilityProvider().deleteSportsFacilitiesById(
        id,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
