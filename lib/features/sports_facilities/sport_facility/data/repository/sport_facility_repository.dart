import 'package:deportivo_dart_api/features/sports_facilities/sport_facility/model/sport_facilitie_model.dart';
import 'package:deportivo_dart_api/features/sports_facilities/sport_facility/model/sport_facility_body.dart';

abstract class SportFacilityRepository {
  //Crea un espacio deportivo
  Future<String> registerSportFacility(SportFacilityBodyParam parms);
  //Trae todos lo espacios deportivo del club registrado(accesstoken)
  Future<List<SportFacilitieModel>> getSportsByUserOwner();
  //Trae todos los espacios deportivos registrados.
  Future<List<SportFacilitieModel>> getAllSportsFacilities();
  //Elimina un espacio en paticular (accesstoken),
  Future<String> deleteSportsFacilitiesById(String id);
  //Edita un espacio en paticular (accesstoken),
  Future<String> editSportsFacilitiesById(String id, SportFacilityBodyParam params);
}
