import 'package:dio/dio.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/core/router/router.dart';
import 'package:recipe_app_ui_kit_food/core/utils/result.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: "http://192.168.11.33:8888/api/v1",
    validateStatus: (status) => true,
  ),
);

class ApiClient {
  ApiClient({required Dio dio,
  }) : _dio = dio;


  final Dio _dio;

  Future<Result<T>> get<T>(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      var response = await _dio.get(
        path,
        queryParameters: queryParams,
        options: Options(
        ),
      );
      if (response.statusCode == 401) {
        router.go(Routers.login);
      }
      if (response.statusCode != 200) {
        return Result.error(Exception(response.data));
      }
      return Result.ok(response.data as T);
    } on Exception catch (exception) {
      return Result.error(exception);
    }
  }

  Future<Result<T>> post<T>(
    String path, {
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        options: Options(
        ),
      );
      if (response.statusCode == 401) {
        router.go(Routers.login);
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Result.ok(response.data as T);
      }
      // return Result.error(response.data);
      return Result.error(Exception(response.data.toString()));

    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
