import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:login_feature/core/constants/end_points.dart';
import 'package:login_feature/core/errors/exception.dart';
import 'package:login_feature/core/errors/failure.dart';
import 'package:login_feature/core/services/api_service.dart';

class DioConsumer extends ApiService {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        logPrint: (object) {
          log(object.toString());
        },
      ),
    );
  }

  @override
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? id,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw CustomException(
        message: ServerFailure.fromDioExcepiton(e).errMessage,
      );
    }
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? id,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData
            ? FormData.fromMap(data as Map<String, dynamic>)
            : data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw CustomException(
        message: ServerFailure.fromDioExcepiton(e).errMessage,
      );
    }
  }

  @override
  Future patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? id,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData
            ? FormData.fromMap(data as Map<String, dynamic>)
            : data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw CustomException(
        message: ServerFailure.fromDioExcepiton(e).errMessage,
      );
    }
  }

  @override
  Future delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? id,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData
            ? FormData.fromMap(data as Map<String, dynamic>)
            : data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw CustomException(
        message: ServerFailure.fromDioExcepiton(e).errMessage,
      );
    }
  }
}
