import 'package:dio/dio.dart';

class BaseResponse {
  final dynamic data;
  final DioError? error;

  BaseResponse({this.data, this.error});
}
