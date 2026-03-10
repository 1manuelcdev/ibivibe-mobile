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
      if (data is String && data.trim().startsWith('{') ||
          data is String && data.trim().startsWith('[')) {
        final decoded = json.decode(data);
        return _encoder.convert(decoded);
      }
    } catch (_) {
      // Se falhar o parse, retorna o toString seguro
    }
    return data.toString();
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      final method = options.method;
      final uri = options.uri.toString();
      final headers = _prettyPrint(options.headers);
      final body = _prettyPrint(options.data);

      logger.d(
        '➡️ ${LogTags.network}${LogTags.dioInterceptor}${LogTags.request}\n'
        'Method: $method\n'
        'URL: $uri\n'
        'Headers:\n$headers\n'
        'Body:\n$body',
      );
    } catch (e) {
      // Silenciosamente ignora erros de log para não quebrar a requisição
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      final uri = response.requestOptions.uri.toString();
      final status = response.statusCode;
      final data = _prettyPrint(response.data);

      logger.i(
        '✅ ${LogTags.network}${LogTags.dioInterceptor}${LogTags.response}\n'
        'URL: $uri\n'
        'Status: $status\n'
        'Data:\n$data',
      );
    } catch (_) {}
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    try {
      logger.e(
        '❌ ${LogTags.network}${LogTags.dioInterceptor}${LogTags.error}\n'
        'URL: ${err.requestOptions.uri}\n'
        'Status: ${err.response?.statusCode}\n'
        'Message: ${err.message}',
        error: err.error,
      );
    } catch (_) {}
    return handler.next(err);
  }
}
