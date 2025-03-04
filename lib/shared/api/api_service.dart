
import 'package:dio/dio.dart';

abstract class ApiService {
  final dio = Dio();

  final String _baseUrl = "https://jsonplaceholder.typicode.com/";

  Future<Response> getRequest(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(
        "$_baseUrl/$endpoint",
        queryParameters: {
          ...?queryParameters,
        },
      );
      return response;
    } catch (e) {
      throw Exception("Error en la petición: $e");
    }
  }
}
