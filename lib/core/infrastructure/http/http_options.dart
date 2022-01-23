import 'package:freezed_annotation/freezed_annotation.dart';

import 'http_method.dart';

part 'http_options.freezed.dart';

/// HTTP request options
@Freezed()
class HttpOptions with _$HttpOptions {
  /// Create a [HttpOptions]
  const factory HttpOptions({
    required String url,
    required HttpMethod method,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    Duration? timeout,
  }) = _HttpOptions;
}
