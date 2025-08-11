import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:delivery_app/src/core/data/app_exceptions.dart';
import 'package:delivery_app/src/core/services/token_managment_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkApi {
  static NetworkApi? _instance;
  static final Dio _dio = Dio();

  // Instead of a static synchronous getter, use an asynchronous function
  static Future<Map<String, dynamic>> getHeader() async {
    final token = await TokenManagementService().getAccessToken();
    return {"Authorization": "Bearer $token"};
  }

  NetworkApi._();

  static NetworkApi get instance {
    _instance ??= NetworkApi._();
    return _instance!;
  }

  Future get({
    required String url,
    Map<String, dynamic>? params,
    Map<String, dynamic>? customHeader,
  }) async {
    // Await header if customHeader is not provided.

    final headers = customHeader ?? await getHeader();
    printFunc(methodType: "GET", url: url, apiHeader: headers);
    try {
      final response = await _dio.get(
        url,
        queryParameters: params,
        options: Options(
          headers: headers,
          sendTimeout: const Duration(milliseconds: 22000),
          receiveTimeout: const Duration(milliseconds: 22000),
        ),
      );
      return returnResponse(response);
    } on DioException catch (e) {
      throw DioExceptionError(_getDioExceptionErrorMessage(e));
    }
  }

  Future post({
    required String url,
    required Map<String, dynamic> body,
    Map<String, dynamic>? customHeader,
    List<MapEntry<String, File>>? files,
  }) async {
    final headers = customHeader ?? await getHeader();
    printFunc(
      methodType: "POST",
      url: url,
      apiHeader: headers,
      body: body,
      files: files,
    );
    Response<dynamic> response;

    try {
      dynamic data;
      if (files != null && files.isNotEmpty) {
        FormData formData = FormData();
        body.forEach((key, value) {
          formData.fields.add(MapEntry(key, value.toString()));
        });
        for (var fileEntry in files) {
          String fileName = fileEntry.value.path.split('/').last;
          formData.files.add(
            MapEntry(
              fileEntry.key,
              await MultipartFile.fromFile(
                fileEntry.value.path,
                filename: fileName,
              ),
            ),
          );
        }
        data = formData;
      } else {
        data = body;
      }

      response = await _dio.post(
        url,
        data: data,
        options: Options(
          sendTimeout: const Duration(milliseconds: 22000),
          receiveTimeout: const Duration(milliseconds: 22000),
          headers: headers,
        ),
      );

      return returnResponse(response);
    } on DioException catch (e) {
      throw DioExceptionError(_getDioExceptionErrorMessage(e));
    }
  }

  Future patch({
    required String url,
    required Map<String, dynamic> body,
    Map<String, dynamic>? customHeader,
    List<MapEntry<String, File>>? files,
  }) async {
    final headers = customHeader ?? await getHeader();
    printFunc(
      methodType: "PATCH",
      url: url,
      apiHeader: headers,
      body: body,
      files: files,
    );
    Response<dynamic> response;

    try {
      dynamic data;
      if (files != null && files.isNotEmpty) {
        FormData formData = FormData();
        body.forEach((key, value) {
          formData.fields.add(MapEntry(key, value.toString()));
        });
        for (var fileEntry in files) {
          String fileName = fileEntry.value.path.split('/').last;
          log(
            "fileEntry key : ${fileEntry.key} fileEntry value: ${fileEntry.value.path}",
          );
          formData.files.add(
            MapEntry(
              fileEntry.key,
              await MultipartFile.fromFile(
                fileEntry.value.path,
                filename: fileName,
              ),
            ),
          );
        }
        data = formData;
      } else {
        data = body;
      }

      response = await _dio.patch(
        url,
        data: data,
        options: Options(
          sendTimeout: const Duration(milliseconds: 22000),
          receiveTimeout: const Duration(milliseconds: 22000),
          headers: headers,
        ),
      );

      return returnResponse(response);
    } on DioException catch (e) {
      throw DioExceptionError(_getDioExceptionErrorMessage(e));
    }
  }

  Future put({
    required String url,
    required Map<String, dynamic> body,
    Map<String, dynamic>? customHeader,
    List<MapEntry<String, File>>? files,
  }) async {
    final headers = customHeader ?? await getHeader();
    printFunc(
      methodType: "PUT",
      url: url,
      apiHeader: headers,
      body: body,
      files: files,
    );
    Response<dynamic> response;

    try {
      dynamic data;
      if (files != null && files.isNotEmpty) {
        FormData formData = FormData();
        body.forEach((key, value) {
          formData.fields.add(MapEntry(key, value.toString()));
        });
        for (var fileEntry in files) {
          String fileName = fileEntry.value.path.split('/').last;
          log(
            "fileEntry key : ${fileEntry.key} fileEntry value: ${fileEntry.value.path}",
          );
          formData.files.add(
            MapEntry(
              fileEntry.key,
              await MultipartFile.fromFile(
                fileEntry.value.path,
                filename: fileName,
              ),
            ),
          );
        }
        data = formData;
      } else {
        data = body;
      }

      response = await _dio.put(
        url,
        data: data,
        options: Options(
          sendTimeout: const Duration(milliseconds: 22000),
          receiveTimeout: const Duration(milliseconds: 22000),
          headers: headers,
        ),
      );

      return returnResponse(response);
    } on DioException catch (e) {
      log(e.toString());
      throw DioExceptionError(_getDioExceptionErrorMessage(e));
    }
  }

  String _getDioExceptionErrorMessage(DioException exception) {
    if (kDebugMode) {
      log(
        "Exception type : ${exception.type}, Response: ${exception.response?.data}",
      );
    }
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timed out";
      case DioExceptionType.receiveTimeout:
        return "Receive timed out";
      case DioExceptionType.sendTimeout:
        return "Send timed out";
      case DioExceptionType.cancel:
        return "Request cancelled";
      case DioExceptionType.badCertificate:
        return "Invalid certificate";
      case DioExceptionType.badResponse:
        return exception.response?.data['message'] ?? "Bad response";
      case DioExceptionType.connectionError:
        return "Connection error";
      case DioExceptionType.unknown:
        return "Unknown error";
    }
  }

  Future delete({
    required String url,
    Map<String, dynamic>? customHeader,
    List<MapEntry<String, File>>? files,
  }) async {
    printFunc(
      methodType: "Delete",
      url: url,
      apiHeader: customHeader ?? await getHeader(),
    );

    try {
      final response = await _dio.delete(
        url,
        options: Options(
          headers: customHeader ?? await getHeader(),
          sendTimeout: const Duration(milliseconds: 22000), //_defaultTimeout,
          receiveTimeout: const Duration(
            milliseconds: 22000,
          ), //_defaultTimeout,
        ),
      );

      return returnResponse(response);
    } on DioException catch (e) {
      throw DioExceptionError(_getDioExceptionErrorMessage(e));
    }
  }

  dynamic returnResponse(Response<dynamic> response) {
    if (kDebugMode) {
      log("Status Code: ${response.statusCode}, Response: ${response.data}");
    }
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 404:
        throw BadRequestException(response.statusMessage);
      case 401:
        throw BadRequestException(response.statusMessage);
      case 443:
      case 500:
        throw InternalServerError(jsonDecode(response.data)['message']);
      case 400:
        {
          dynamic jsonResponse = jsonDecode(response.data);
          throw InvalidInputException(jsonResponse['message']);
        }
      default:
        throw FetchDataException(response.statusMessage);
    }
  }

  void printFunc({
    required String methodType,
    required String url,
    Map<String, dynamic>? body,
    required Map<String, dynamic> apiHeader,
    List<MapEntry<String, File>>? files,
  }) {
    debugPrint(
      "------------------------- $methodType ---------------------------",
    );
    debugPrint(" url = $url");
    if (body != null) debugPrint("body = $body");
    if (files != null) debugPrint("files length = ${files.length}");
    debugPrint("header = $apiHeader");
    debugPrint(
      "-------------------------------------------------------------------",
    );
  }
}
