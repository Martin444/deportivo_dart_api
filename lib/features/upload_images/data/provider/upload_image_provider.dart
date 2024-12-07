import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:deportivo_dart_api/core/api.dart';
import 'package:deportivo_dart_api/features/upload_images/data/repository/upload_file_repository.dart';

class UploadFileProvider extends UploadFileRepository {
  final Dio _dio = Dio();
  @override
  Future<String> uploadFile(image) async {
    try {
      Uri uploadURl = Uri.parse('${API.defaulBaseUrl}/cloudinary/upload');
      var responseUp = await _dio.post(
        uploadURl.toString(),
        data: FormData.fromMap(
          {
            'file': MultipartFile.fromBytes(
              image,
              filename: 'plato${DateTime.now().toIso8601String()}',
            ),
          },
        ),
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data', // Especifica el tipo de contenido
          },
        ),
      );

      var respoJson = jsonDecode(responseUp.toString());

      return respoJson['body'].toString();
    } catch (e) {
      rethrow;
    }
  }
}
