import 'package:dartz/dartz.dart';

import '../failures/failure.dart';

/// A base usecase class, which is extended by usecases
abstract class UseCase<ResponseType, Params> {
  /// Executes the use case and return a successful [ResponseType]
  /// or a [Failure]
  Future<Either<Failure, ResponseType>> call(Params params);
}

/// An empty parameter class, which is used by usecases that does not require
/// any parameter as input.
class NoParams {}
