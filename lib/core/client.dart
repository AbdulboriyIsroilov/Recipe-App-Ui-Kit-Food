import 'package:dio/dio.dart';
import 'package:recipe_app_ui_kit_food/core/router/router_names.dart';
import 'package:recipe_app_ui_kit_food/core/router/router.dart';
import 'package:recipe_app_ui_kit_food/core/utils/result.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: "http://192.168.10.71:8888/api/v1",
    validateStatus: (status) => true,
  ),
);

// class ApiClint {
//   ApiClint({required this.interceptor}) {
//     _dio = Dio(
//       BaseOptions(
//         baseUrl: "http://192.168.9.213:8888/api/v1",
//         validateStatus: (status) => true,
//       ),
//     )..interceptors.add(interceptor);
//   }
//
//   final AuthInterceptor interceptor;
//
//   late final Dio _dio;
//
//   Future<Result<T>> get<T>(String path, {Map<String, dynamic>? queryParams}) async {
//     try {
//       var response = await _dio.get(path, queryParameters: queryParams);
//       if (response.statusCode != 200) {
//         return Result.error(Exception(response.data));
//       }
//       return Result.ok(response.data as T);
//     } on Exception catch (exception) {
//       return Result.error(exception);
//     }
//   }
//
//   Future<Result<T>> post<T>(String path, {required Map<String, dynamic> data}) async {
//     try {
//       var response = await _dio.post(path, data: data);
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return Result.ok(response.data as T);
//       }
//       return Result.error(response.data);
//     } on Exception catch (e) {
//       return Result.error(e);
//     }
//   }
//
//   Future<Result<T>> patch<T>(String path, {required Map<String, dynamic> data}) async {
//     try {
//       var response = await _dio.patch(path, data: data);
//       if (response.statusCode != 200) {
//         return Result.error(response.data);
//       }
//       return Result.ok(response.data as T);
//     } on Exception catch (e) {
//       return Result.error(e);
//     }
//   }
//
//   Future<Result> delete(String path) async {
//     try {
//       var response = await _dio.delete(path);
//       if (response.statusCode != 204) {
//         return Result.error(response.data);
//       }
//       return Result.ok(response.data);
//     } on Exception catch (e) {
//       return Result.error(e);
//     }
//   }
// }

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
      return Result.error(response.data);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
