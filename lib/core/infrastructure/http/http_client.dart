import 'dart:async';

import 'http_interceptor.dart';
import 'http_response.dart';

///
/// Http client
///
abstract class HttpClient {
  ///
  /// Http Get
  ///
  Future<HttpResponse> get(
    String url, {
    Map<String, String>? headers,
    Duration? timeout,
  });

  ///
  /// Http Post
  ///
  Future<HttpResponse> post(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Duration? timeout,
  });

  ///
  /// Http Put
  ///
  Future<HttpResponse> put(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Duration? timeout,
  });

  ///
  /// Http Path
  ///
  Future<HttpResponse> patch(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Duration? timeout,
  });

  ///
  /// Http Delete
  ///
  Future<HttpResponse> delete(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Duration? timeout,
  });

  ///
  /// Adds a custom interceptor to handle requests, responses and errors.
  ///
  /// If there's more than one interceptor, they'll be executed sequentially.
  ///
  void addInterceptor(HttpInterceptor interceptor);
}
