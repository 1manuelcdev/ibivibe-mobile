import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ibiapabaapp/core/logger/log_tags.dart';
import 'package:logger/logger.dart';

class DioLoggerInterceptor extends Interceptor {
  final Logger logger;

  DioLoggerInterceptor(this.logger);

  static const JsonEncoder _encoder = JsonEncoder.withIndent('  ');

  String _prettyPrint(dynamic data) {
    if (data == null) return 'null';

    try {
      if (data is Map || data is List) {
        return _encoder.convert(data);
      }

      if (data is String) {
        final decoded = json.decode(data);
        return _encoder.convert(decoded);
      }
    } catch (_) {}

    return data.toString();
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.d(
      '➡️ ${LogTags.network}${LogTags.dioInterceptor}${LogTags.request}\n'
      '${options.method} ${options.uri}\n'
      'Headers:\n${_prettyPrint(options.headers)}\n'
      'Body:\n${_prettyPrint(options.data)}',
    );
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i(
      '✅ ${LogTags.network}${LogTags.dioInterceptor}${LogTags.response}\n'
      '${response.requestOptions.uri}\n'
      'Status: ${response.statusCode}\n'
      'Data:\n${_prettyPrint(response.data)}',
    );
    handler.next(response);
  }

  @override
  void onError(err, handler) {
    logger.e(
      '${LogTags.network}${LogTags.dioInterceptor}${LogTags.error}',
      error: {err.error?.toString()},
    );
    handler.next(err);
  }
}
