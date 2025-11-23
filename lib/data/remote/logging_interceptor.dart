import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';

class PrettyLoggingInterceptor implements Interceptor {
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    final request = chain.request;
    if (kDebugMode) {
      log('--> ${request.method} ${request.url}');
      request.headers.forEach((k, v) => log('$k: $v'));
      if (request.body != null) {
        log('Request Body:');
        log(_prettyPrint(request.body));
      }
      log('--> END ${request.method}');
    }

    final response = await chain.proceed(request);

    if (kDebugMode) {
      log('<-- ${response.statusCode} ${response.base.request?.url}');
      response.headers.forEach((k, v) => log('$k: $v'));
      if (response.body != null) {
        log('Response Body:');
        log(_prettyPrint(response.body));
      }
      log('<-- END HTTP');
    }
    return response;
  }

  String _prettyPrint(dynamic body) {
    try {
      if (body is String) {
        final decoded = jsonDecode(body);
        return const JsonEncoder.withIndent('  ').convert(decoded);
      } else if (body is Map || body is List) {
        return const JsonEncoder.withIndent('  ').convert(body);
      }
      return body.toString();
    } catch (e) {
      return body.toString();
    }
  }
}
