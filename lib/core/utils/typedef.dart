import 'package:dartz/dartz.dart';
import 'package:flutter_exam/core/utils/error_handler.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultVoid = ResultFuture<void>;
