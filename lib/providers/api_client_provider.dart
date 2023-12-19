import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/entities/api_error.dart';
import 'package:flutter_app/providers/shared_preferences_provider.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'api_client_provider.g.dart';

@riverpod
ApiClient apiClient(ApiClientRef ref) {
  return ApiClient(ref);
}

class ApiClient {
  final ProviderRef _ref;

  ApiClient(this._ref);

  String get _accessToken => _sharedPreferences.getString('accessToken') ?? '';

  SharedPreferences get _sharedPreferences => _ref.read(sharedPreferencesProvider);

  get(
    String path, [
    Map<String, dynamic>? queryParameters,
  ]) {
    return request(
      method: 'GET',
      path: path,
      queryParameters: queryParameters,
    );
  }

  post(
    String path, [
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  ]) {
    return request(
      method: 'POST',
      path: path,
      queryParameters: queryParameters,
      body: body,
    );
  }

  patch(
    String path, [
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  ]) {
    return request(
      method: 'PATCH',
      path: path,
      queryParameters: queryParameters,
      body: body,
    );
  }

  delete(
    String path, [
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  ]) {
    return request(
      method: 'DELETE',
      path: path,
      queryParameters: queryParameters,
      body: body,
    );
  }

  _setFormData(
    MultipartRequest request,
    data, [
    String? parent,
  ]) {
    if (data is List) {
      data = data.asMap();
    }

    if (data is! Map) {
      throw Exception('올바르지 않는 요청 입니다.');
    }

    data.forEach((key, value) {
      final name = parent != null ? '$parent[$key]' : key;

      if (value is PlatformFile) {
        request.files.add(MultipartFile.fromBytes(
          name,
          value.bytes as List<int>,
          filename: value.name,
        ));
      } else if (value is List || value is Map) {
        _setFormData(request, value, name);
      } else if (value != null) {
        request.fields[name] = value.toString();
      }
    });
  }

  request({
    required String method,
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    method = method.toUpperCase();

    final String _method = method;
    if (!['POST', 'GET'].contains(_method)) {
      method = 'POST';
    }

    final request = MultipartRequest(
      method,
      Uri.http(
        Constants.API_HOST,
        path,
        queryParameters,
      ),
    );

    if (_accessToken.isNotEmpty) {
      request.headers.putIfAbsent('Authorization', () => 'Bearer $_accessToken');
    }

    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
    });

    if (!['POST', 'GET'].contains(_method)) {
      request.fields['_method'] = _method;
    }

    if (body != null) {
      _setFormData(request, body);
    }

    final StreamedResponse response = await request.send();
    final dynamic json = jsonDecode(await response.stream.bytesToString());

    if (200 <= response.statusCode && response.statusCode < 300) {
      return json;
    }

    throw ApiError.fromJson(json);
  }
}
