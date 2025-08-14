import 'package:dio/dio.dart';
import 'package:recipe_app_ui_kit_food/core/utils/result.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: "http://192.168.10.71:8888/api/v1",
    validateStatus: (status) => true,
  ),
);
class ApiClint {
  final _dio = Dio(
    BaseOptions(
      baseUrl: "http://192.168.10.71:8888/api/v1",
      validateStatus: (status) => true,
    ),
  );

  Future<Result<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParams);
      if (response.statusCode != 200) {
        return Result.error(Exception(response.data));
      }
      return Result.ok(response.data as T);
    } on Exception catch (exception) {
      return Result.error(exception);
    }
  }

  Future<Result> post(
    String path, {
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _dio.post(path, data: data);
      if (response.statusCode != 200 && response.statusCode != 201) {
        return Result.error(Exception(response.data));
      }
      return Result.ok(response.data);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
