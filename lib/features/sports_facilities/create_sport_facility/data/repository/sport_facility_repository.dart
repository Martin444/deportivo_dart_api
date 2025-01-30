import 'package:deportivo_dart_api/features/sports_facilities/create_sport_facility/model/sport_facility_body.dart';

abstract class SportFacilityRepository {
  Future<dynamic> registerSportFacility(SportFacilityBodyParam parms);
}
