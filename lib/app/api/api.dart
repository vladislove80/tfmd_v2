import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tfmd_v2/app/model/response/base_response.dart';

@singleton
class ApiManager {
  static const TIME_OUT = 1000 * 60;
  static late Dio _dio;

  ApiManager() {
    _dio = Dio(
      BaseOptions()
        ..contentType = 'application/json'
        ..connectTimeout = TIME_OUT
        ..receiveTimeout = TIME_OUT
        ..sendTimeout = TIME_OUT
        ..headers = {
          'Accept': 'application/json',
          'X-Requested-With': 'XMLHttpRequest'
        },
    );
  }

  Future<BaseResponse> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await _dio.get(
            path,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
          );
      return BaseResponse(data: response);
    } on DioError catch (error) {
      return BaseResponse(error: error);
    }
  }
}
