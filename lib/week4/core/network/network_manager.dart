import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../exception/env_not_found.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager get instance {
    if (_instance != null) return _instance!;

    _instance = NetworkManager._init();
    return _instance!;
  }

  final String _baseUrl = 'BASE_URL';
  late final Dio dio;

  NetworkManager._init() {
    final url = env[_baseUrl];

    if (url != null) {
      dio = Dio(BaseOptions(baseUrl: url));
      if (kDebugMode) dio.interceptors.add(PrettyDioLogger());

      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          options.path += '.json';
          handler.next(options);
        },
      ));
    } else {
      throw EnvNotFound(_baseUrl);
    }
  }
}
