import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:starter_app/src/env/env.dart';

part 'dio_client.g.dart';

class DioClient {
  factory DioClient() {
    return _instance ??= DioClient._private();
  }

  DioClient._private() {
    _dio = createDioClient();
  }

  static DioClient? _instance;
  static late Dio _dio;
  Dio get instance => _dio;

  Dio createDioClient() {
    final baseUrl = Env.apiUrl;
    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: baseUrl,
        headers: {
          Headers.acceptHeader: Headers.jsonContentType,
          Headers.contentTypeHeader: Headers.jsonContentType,
        },
      );

    return dio;
  }
}

@riverpod
Dio defaultDioClient(DefaultDioClientRef ref) {
  return DioClient().instance;
}
