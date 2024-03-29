import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:requests_inspector/requests_inspector.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_application/common/constants/urls.dart';
import 'package:wallpaper_application/common/core_data_source/exception.dart';
import 'package:wallpaper_application/injection/injection.dart';

import '../../constants/strings.dart';

part 'dio_helper.g.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

@riverpod
Dio client(ClientRef ref) {
  return Dio()
    ..interceptors.add(RequestsInspectorInterceptor())
    ..options.baseUrl = Urls.baseUrl
    ..options.headers = {
      'Accept': '*/*',
      'Authorization':
          'DmzXTIB1e58YwvG5CG1DkO4gzm4giBOJnsjikzxjgFxnSEkANlwjuMcg'
    };
}

@riverpod
DioHelper dioHelper(DioHelperRef ref) {
  return DioHelper(
    dio: ref.read(clientProvider),
  );
}

class DioHelper {
  final Dio dio;
  DioHelper({required this.dio});

  Future<Map<String, dynamic>> doPostRequest(
      {required String url, Map<String, dynamic>? data}) async {
    FormData? formData;
    if (data != null) {
      formData = FormData.fromMap(data);
    }
    return _handleException(dio.post(url, data: formData));
  }

  Future<Map<String, dynamic>> doPatchRequest(
      {required String url, Map<String, dynamic>? data}) async {
    FormData? formData;
    if (data != null) {
      formData = FormData.fromMap(data);
    }
    return _handleException(dio.patch(url, data: formData));
  }

  Future<Map<String, dynamic>> doDeleteRequest(
      {required String url, Map<String, dynamic>? data}) async {
    FormData? formData;
    if (data != null) {
      formData = FormData.fromMap(data);
    }
    return _handleException(dio.delete(url, data: formData));
  }

  Future<File> downloadFile(String url) async {
    final dio = Dio();
    final directory = await getApplicationDocumentsDirectory();
    final response = await dio.get(
      url,
      options: Options(responseType: ResponseType.bytes),
    );
    final contentType = response.headers.map['content-type']?.first;
    final extension = contentType?.split('/').last ?? 'jpg';
    final filePath =
        '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.$extension';
    final file = File(filePath);
    await file.writeAsBytes(response.data);
    return file;
  }

  Future<Map<String, dynamic>> doGetRequest({
    required String url,
    String? baseURL,
    Map<String, dynamic>? queryParams,
    bool useAuthIfAvailable = false,
  }) async {
    return _handleException(
      dio.get(
        url,
        queryParameters: queryParams,
      ),
    );
  }

  Future<Map<String, dynamic>> _handleException(
      Future<Response<dynamic>> function) async {
    try {
      final response = await function;
      late final Map<String, dynamic> result;
      if (response.data is String) {
        result = jsonDecode(response.data);
      } else {
        result = response.data;
      }
      logger.i(response.realUri);
      logger.wtf(result);
      if (!result.containsKey('statusCode')) {
        return result;
      }
      if (result['statusCode'] == Strings.successStatusCode ||
          result['statusCode'] == Strings.successStatusCode2) {
        return result;
      }

      if (result['statusCode'] == Strings.unAuthorizedStatusCode) {
        throw UnAuthorizedException();
      } else if (result['statusCode'] == Strings.unVerifiedStatusCode) {
        throw UnVerifiedException();
      } else {
        late final String errorMessage;
        if (result['message'] is List) {
          errorMessage = result['message'].first;
        } else {
          errorMessage = result['message'];
        }
        throw ServerException(message: errorMessage);
      }
    } on DioError catch (dioError) {
      final responseBody = dioError.response!.data;
      final response = dioError.response!;
      logger.e(response.requestOptions.uri);
      logger.wtf(response);
      logger.wtf(StackTrace.current);

      if (response.statusCode == Strings.unAuthorizedStatusCode) {
        throw UnAuthorizedException();
      } else if (response.statusCode == Strings.unVerifiedStatusCode) {
        throw UnVerifiedException();
      } else {
        late final String errorMessage;
        if (responseBody['message'] is List) {
          errorMessage = responseBody['message'].first;
        } else {
          errorMessage = responseBody['message'];
        }
        throw ServerException(message: errorMessage);
      }
    } catch (error) {
      rethrow;
    }
  }
}
