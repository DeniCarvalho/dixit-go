/// A server excepetion, which is used by remotes `datasources`
class ServerException {
  /// Creates a [ServerException]
  const ServerException({
    required String message,
    String? cause,
    dynamic data,
  });
}
