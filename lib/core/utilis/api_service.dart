import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://dummyjson.com/';
  final Dio _dio;
  ApiService(this._dio);

  Future<dynamic> get({required String endPoints}) async {
    var response = await _dio.get('$_baseUrl$endPoints');

    return response.data;
  }
}
