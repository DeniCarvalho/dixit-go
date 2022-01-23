import 'package:freezed_annotation/freezed_annotation.dart';

import 'failure.dart';

part 'data_failure.freezed.dart';
part 'data_failure.g.dart';

/// A data failure that represents a failed attempt to access data
@Freezed()
class DataFailure extends Failure with _$DataFailure {
  /// Creates an [DataFailure]
  const factory DataFailure({
    @Default('') String message,
  }) = _DataFailure;

  /// Maps a json-string to [DataFailure]
  factory DataFailure.fromJson(Map<String, dynamic>? json) =>
      json == null ? const DataFailure() : _$DataFailureFromJson(json);
}
