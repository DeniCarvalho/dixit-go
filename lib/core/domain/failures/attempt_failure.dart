import 'package:freezed_annotation/freezed_annotation.dart';

import 'failure.dart';

part 'attempt_failure.freezed.dart';
part 'attempt_failure.g.dart';

/// AttemptFailure
@Freezed()
class AttemptFailure extends Failure with _$AttemptFailure {
  /// Creates an [AttemptFailure]
  const factory AttemptFailure({
    int? attemptsLimit,
    String? message,
  }) = _AttemptFailure;

  /// Maps a json-string to [AttemptFailure]
  factory AttemptFailure.fromJson(Map<String, dynamic>? json) =>
      json == null ? const AttemptFailure() : _$AttemptFailureFromJson(json);
}
