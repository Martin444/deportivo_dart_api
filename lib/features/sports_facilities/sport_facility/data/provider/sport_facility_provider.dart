import 'dart:convert';

import 'package:deportivo_dart_api/core/api.dart';
import 'package:deportivo_dart_api/core/exeptions/api_exception.dart';
import 'package:deportivo_dart_api/features/sports_facilities/sport_facility/data/repository/sport_facility_repository.dart';
import 'package:deportivo_dart_api/features/sports_facilities/sport_facility/model/sport_facilitie_model.dart';
import 'package:deportivo_dart_api/features/sports_facilities/sport_facility/model/sport_facility_body.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class SportFacilityProvider extends SportFacilityRepository {
  @override
  Future<String> registerSportFacility(SportFacilityBodyParam parms) async {
    try {
      Uri registerURL = Uri.parse('${API.defaulBaseUrl}/sports-facilities');

      // Crear una solicitud Multipart
      var request = http.MultipartRequest('POST', registerURL);

      // Añadir el accesstoken al header
      request.headers['Authorization'] = 'Bearer ${API.loginAccessToken}';

      var locationJsonForamated = jsonEncode(parms.location.toJson());

      request.fields['name'] = parms.name;
      request.fields['type'] = parms.type;
      request.fields['location'] = locationJsonForamated;
      request.fields['daysAbilables'] = jsonEncode(parms.daysAbilables);
      request.fields['startsTimesAbilables'] = jsonEncode(parms.startsTimesAbilables);
      request.fields['endTimesAbilables'] = jsonEncode(parms.endTimesAbilables);
      request.fields['isActive'] = parms.isActive.toString();

      for (int i = 0; i < parms.files.length; i++) {
        var multipartFile = http.MultipartFile.fromBytes(
          'files',
          parms.files[i],
          filename: 'file_$i.jpg',
          contentType: MediaType('image', 'jpeg'),
        );
        request.files.add(multipartFile);
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode != 201) {
        throw ApiException(
          response.statusCode,
          response.body,
        );
      }
      return response.body;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SportFacilitieModel>> getSportsByUserOwner() async {
    try {
      Uri userURl = Uri.parse('${API.defaulBaseUrl}/sports-facilities/me');
      var response = await http.get(
        headers: {'Authorization': 'Bearer ${API.loginAccessToken}'},
        userURl,
      );
      if (response.statusCode != 200) {
        throw ApiException(
          response.statusCode,
          response.body,
        );
      }

      var respJson = jsonDecode(response.body) as List;

      // Verificar si respJson está vacío
      if (respJson.isEmpty) {
        return [];
      }
      // Convertir la respuesta JSON a una lista de SportFacilitieModel
      List<SportFacilitieModel> sportsFinded = respJson.map((json) {
        var sportFacility = SportFacilitieModel.fromJson(json);
        return sportFacility;
      }).toList();

      return sportsFinded;
    } catch (e) {
      rethrow;
    }
  }
}
