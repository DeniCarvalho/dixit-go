import '../../core.dart';

/// A server excepetion, which is used by remotes `datasources`
class ServerException extends BaseException {
  /// Creates a [ServerException]
  const ServerException({
    required String message,
    String? cause,
    dynamic data,
  }) : super(
          message: message,
          cause: cause,
          data: data,
        );

  @override
  List<Object?> get props => [cause, message, data];
}
