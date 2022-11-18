import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../main/values/constants/http_url.dart';
import '../../main/values/enums/general_enum.dart';
import '../exceptions/http_error_exception.dart';
import 'ihttp_client.dart';

/// written this class for http client
class HttpClient extends IHttpClient {
  HttpClient._() : super(HttpUrl.baseUrl);

  static final HttpClient _instance = HttpClient._();

  factory HttpClient() => _instance;

  /// http get method
  // ignore: long-parameter-list
  Future<http.Response?> request(
    HttpMethod httpMethod,
    String method, {
    required Map<String, String>? headerParam,
    Map<String, dynamic> bodyParam = const {},
    String pathBody = '',
  }) async {
    http.Response? response = await _request(
      httpMethod,
      method,
      headerParam,
      bodyParam,
      pathBody,
    ).catchError(
      (error, stackTrace) => _httpErrorHandler(
        '${HttpUrl.baseUrl}/$method',
        error,
        stackTrace,
        headerParam,
        bodyParam,
      ),
    );

    if (response!.statusCode >= HttpStatus.clientClosedRequest &&
        response.statusCode < HttpStatus.networkConnectTimeoutError) {
      throw ServerError();
    }

    return response;
  }

  // ignore: long-parameter-list
  Future<http.Response?> _request(
    HttpMethod httpMethod,
    String method,
    Map<String, String>? headerParam,
    Map<String, dynamic> bodyParam,
    String pathBody,
  ) async {
    final http.Response? response;
    switch (httpMethod) {
      case HttpMethod.get:
        response = await get(
          method,
          headerParam: headerParam,
          bodyParam: bodyParam,
          pathBody: pathBody,
        );
        break;
      case HttpMethod.post:
        response = await post(
          method,
          headerParam: headerParam,
          bodyParam: bodyParam,
        );
        break;
      case HttpMethod.put:
        response = await put(
          method,
          headerParam: headerParam,
          bodyParam: bodyParam,
        );
        break;
      case HttpMethod.delete:
        response = await delete(
          method,
          headerParam: headerParam,
          bodyParam: bodyParam,
        );
        break;
      case HttpMethod.update:
        response = await update(
          method,
          headerParam: headerParam,
          bodyParam: bodyParam,
        );
        break;
    }

    return response;
  }

  // ignore: long-parameter-list
  _httpErrorHandler(
    String url,
    error,
    stackTrace,
    Map<String, String>? header,
    Map<String, dynamic> requestBody,
  ) {
    if (error is SocketException) {
      throw InternetError();
    } else {
      throw AppException();
    }
  }
}
