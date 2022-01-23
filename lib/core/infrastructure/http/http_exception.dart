import 'package:equatable/equatable.dart';

import 'http_status.dart';

///
/// Http base exception
///
abstract class HttpException extends Equatable {
  ///
  /// Http status code
  ///
  final int? status;

  ///
  /// Error message
  ///
  final String? message;

  ///
  /// Optional data
  ///
  final Object? data;

  ///
  /// Creates a new [HttpException]
  ///
  const HttpException(
    this.status, {
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [status, data, message];
}

///
/// Exception for [HttpStatus.badRequest]
///
class BadRequestException extends HttpException {
  ///
  /// Creates a new [BadRequestException]
  ///
  BadRequestException({
    int? status,
    Object? data,
    String? message,
  }) : super(
          status ?? HttpStatus.badRequest.code,
          data: data,
          message: message,
        );
}

///
/// Exception for [HttpStatus.internalServerError]
///
class ServerErrorException extends HttpException {
  ///
  /// Creates a new [ServerErrorException]
  ///
  ServerErrorException({
    String? message,
  }) : super(
          HttpStatus.serverError.code,
          message: message,
        );
}

///
/// Exception for [HttpStatus.unauthorized]
///
class UnauthorizedException extends HttpException {
  ///
  /// Creates a new [UnauthorizedException]
  ///
  UnauthorizedException({
    String? message,
  }) : super(
          HttpStatus.unauthorized.code,
          message: message,
        );
}

///
/// Exception for [HttpStatus.internalServerError]
///
class TimeoutException extends HttpException {
  ///
  /// Creates a new [TimeoutException]
  ///
  const TimeoutException({
    String? message,
  }) : super(
          null,
          message: message,
        );
}
