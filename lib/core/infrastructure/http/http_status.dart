///
/// Internal HttpStatus reference
///
enum HttpStatus {
  /// 200
  ok,

  /// 201
  created,

  /// 202
  accepted,

  /// 204
  noContent,

  /// 400
  badRequest,

  /// 401
  unauthorized,

  /// 403
  forbidden,

  /// 404
  notFound,

  /// 500
  serverError,
}

///
/// Extension to set [HttpStatus] codes
///
extension HttpStatusCode on HttpStatus {
  ///
  /// Get the integer code related to [HttpStatus]
  ///
  int get code {
    switch (this) {
      case HttpStatus.ok:
        return 200;
      case HttpStatus.created:
        return 201;
      case HttpStatus.accepted:
        return 202;
      case HttpStatus.noContent:
        return 204;
      case HttpStatus.badRequest:
        return 400;
      case HttpStatus.unauthorized:
        return 401;
      case HttpStatus.forbidden:
        return 403;
      case HttpStatus.notFound:
        return 404;
      case HttpStatus.serverError:
      default:
        return 500;
    }
  }
}
