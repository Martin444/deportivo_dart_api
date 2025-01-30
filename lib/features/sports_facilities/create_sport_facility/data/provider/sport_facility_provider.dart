import 'dart:convert';

import 'package:deportivo_dart_api/core/api.dart';
import 'package:deportivo_dart_api/core/exeptions/api_exception.dart';
import 'package:deportivo_dart_api/features/sports_facilities/create_sport_facility/data/repository/sport_facility_repository.dart';
import 'package:deportivo_dart_api/features/sports_facilities/create_sport_facility/model/sport_facility_body.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class SportFacilityProvider extends SportFacilityRepository {
  @override
  Future registerSportFacility(SportFacilityBodyParam parms) async {
    try {
      Uri registerURL = Uri.parse('${API.defaulBaseUrl}/sports-facilities');

      // Crear una solicitud Multipart
      var request = http.MultipartRequest('POST', registerURL);

      request.fields['name'] = parms.name;
      request.fields['type'] = parms.type;
      request.fields['location'] = parms.location;
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

      var respJson = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw ApiException(
          respJson['statusCode'] ?? response.statusCode,
          respJson['message'],
        );
      }
    } catch (e) {}
  }
}
