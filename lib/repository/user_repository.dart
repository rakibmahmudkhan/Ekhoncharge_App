import 'package:dio/dio.dart';
import 'package:ekhoncharge/api/apis.dart';
import 'package:ekhoncharge/network/network_api_services.dart';

class UserRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> postPhotoAPI(String fileName, String path, int userId) async {
    var req = FormData.fromMap(
      {
        'file': await MultipartFile.fromFile(
          path,
          filename: fileName,
        ),
      },
    );
    final response = await _apiService.multiParts(
        url: '${APIs.profilePhotoUploadAPI}/$userId',
        request: req,
        isTokenRequired: true,
        uploadedCount: '');
    return response;
  }

  Future<dynamic> fetchProfessionDataListAPIRepo() async {
    final response = await _apiService.get(
      url: APIs.professionDataListAPI,
      isTokenRequired: true,
    );
    return response;
  }


  Future<dynamic> postProfileUpdate({
    required String? first_name,
    required String? last_name,
    required String? full_name,
    required String? gender,
    required String? dob,
    required int? profession_id,
    required String? profession_uuid,
    required String? profession_title,

    required int userId
  }) async {
    Map<String, dynamic> request = {
      'first_name': first_name,
      'last_name': last_name,
      'full_name': full_name,
      'gender': gender,
      'dob': dob,
      'profession_id': profession_id,
      'profession_uuid': profession_uuid,
      'profession_title': profession_title,

    };
    final response = await _apiService.post(
      url: "${APIs.profileUpdateAPI}/$userId",
      request: request,
      isTokenRequired: true,
    );
    return response;
  }

}