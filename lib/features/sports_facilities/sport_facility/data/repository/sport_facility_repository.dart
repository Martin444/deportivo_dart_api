import 'package:deportivo_dart_api/features/sports_facilities/sport_facility/model/sport_facilitie_model.dart';
import 'package:deportivo_dart_api/features/sports_facilities/sport_facility/model/sport_facility_body.dart';

abstract class SportFacilityRepository {
  Future<String> registerSportFacility(SportFacilityBodyParam parms);
  Future<List<SportFacilitieModel>> getSportsByUserOwner();
  Future<List<SportFacilitieModel>> getAllSportsFacilities();
}
