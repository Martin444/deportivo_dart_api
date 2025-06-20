import 'dart:convert';
import 'dart:typed_data';

// ignore: depend_on_referenced_packages
import 'package:deportivo_dart_api/core/api.dart';
import 'package:deportivo_dart_api/core/exeptions/api_exception.dart';
import 'package:deportivo_dart_api/features/auth/login/model/user_succes_model.dart';
import 'package:deportivo_dart_api/features/auth/register/data/repository/register_commerce_respository.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';

class RegisterCommerceProvider extends RegisterCommerceRespository {
  @override
  Future<UserSuccess> registerCommerce({
    required Uint8List photo,
    required String email,
    required String name,
    required String phone,
    required String role,
    required String password,
  }) async {
    try {
      Uri registerURL = Uri.parse('${API.defaulBaseUrl}/auth/register');

      // Crear una solicitud Multipart
      var request = http.MultipartRequest('POST', registerURL);

      // Agregar campos al cuerpo de la solicitud
      request.fields['email'] = email;
      request.fields['name'] = name;
      request.fields['phone'] = phone;
      request.fields['password'] = password;
      request.fields['role'] = role;
      request.fields['needToChangepassword'] = 'false';

      // Convertir Uint8List a MultipartFile
      var multipartFile = http.MultipartFile.fromBytes(
        'photo', // Nombre del campo en el servidor
        photo,
        filename: 'photo.jpg',
        contentType: MediaType('image', 'jpeg'), // Ajusta el tipo MIME según tu archivo
      );

      // Añadir archivo a la solicitud
      request.files.add(multipartFile);

      // Enviar la solicitud
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      // Manejo de respuesta
      var respJson = jsonDecode(response.body);
      if (respJson['access_token'] == null) {
        throw ApiException(
          respJson['statusCode'] ?? 32,
          respJson['message'],
        );
      }

      return UserSuccess(
        accessToken: respJson['access_token'],
        needToChangePassword: respJson['needToChangePassword'],
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserSuccess> registerWithSocialToken({
    required String socialToken,
    required String email,
    required String photoUrl,
    required String name,
    required String phone,
    required String role,
  }) async {
    try {
      Uri registerURL = Uri.parse('${API.defaulBaseUrl}/auth/social/register');

      // Crear una solicitud Multipart
      var request = http.MultipartRequest('POST', registerURL);

      // Agregar campos al cuerpo de la solicitud
      request.fields['email'] = email;
      request.fields['name'] = name;
      request.fields['phone'] = phone;
      request.fields['photoURL'] = photoUrl;
      request.fields['socialToken'] = socialToken;
      request.fields['role'] = role;
      request.fields['needToChangepassword'] = 'false';

      // // Convertir Uint8List a MultipartFile
      // var multipartFile = http.MultipartFile.fromBytes(
      //   'photo', // Nombre del campo en el servidor
      //   photoUrl, // Convertir URL a bytes
      //   filename: 'photo.jpg',
      //   contentType: MediaType('image', 'jpeg'), // Ajusta el tipo MIME según tu archivo
      // );

      // // Añadir archivo a la solicitud
      // request.files.add(multipartFile);

      // Enviar la solicitud
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      // Manejo de respuesta
      var respJson = jsonDecode(response.body);
      if (respJson['access_token'] == null) {
        throw ApiException(
          respJson['statusCode'] ?? 32,
          respJson['message'],
        );
      }

      return UserSuccess(
        accessToken: respJson['access_token'],
        needToChangePassword: respJson['needToChangePassword'],
      );
    } catch (e) {
      rethrow;
    }
  }
}
