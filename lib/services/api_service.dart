import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<APIService>((ref) => APIService(ref.read));
final dioProvider = Provider<Dio>((ref) => Dio());

class APIService {
  APIService(this._read);
  final Reader _read;

  Future<dynamic> getData(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? header,
  }) async {
    final response = await _read(dioProvider).get(
      path,
      queryParameters: params,
      options: Options(headers: header),
    );
    if (response.statusCode == 200) {
      return response.data;
    }
    log('Request $path failed\nResponse: ${response.statusCode} ${response.statusMessage}');
    throw response;
  }

  Future<dynamic> postData(
    String path, {
    Map<String, dynamic>? header,
    Map<String, dynamic>? params,
    dynamic dataParams,
  }) async {
    log('----------------------------------------------------------');
    log('post url - $path\n params - $params');
    final response = await _read(dioProvider).post(
      path,
      queryParameters: params,
      options: Options(headers: header),
      data: dataParams,
    );
    if (response.statusCode == 200) {
      return response.data;
    }
    log('Request $path failed\nResponse: ${response.statusCode} ${response.statusMessage}');
    throw response;
  }

  Future<dynamic> deleteData(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? header,
  }) async {
    log('----------------------------------------------------------');
    log('post url - $path\n header - $header');

    final response = await _read(dioProvider).delete(
      path,
      queryParameters: params,
      options: Options(headers: header),
    );
    if (response.statusCode == 200) {
      if (response.data != null) {
        return response.data;
      }
    }
    log('Request $path failed\nResponse: ${response.statusCode} ${response.statusMessage}');
    throw response;
  }
}
