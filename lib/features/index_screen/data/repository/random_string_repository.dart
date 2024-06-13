import 'package:dartz/dartz.dart';
import 'package:flutter_exam/core/utils/error_handler.dart';
import 'package:flutter_exam/core/utils/logger.dart';
import 'package:flutter_exam/core/utils/typedef.dart';
import 'package:flutter_exam/features/index_screen/data/model/random_string_dto.dart';
import 'package:flutter_exam/features/index_screen/domain/repository/i_random_string_repository.dart';
import 'package:flutter_exam/services/test_services.dart';

class RandomStringRepository implements IRansomStringRepository {
  final TestServices _testServices;

  RandomStringRepository(this._testServices);
  @override
  ResultFuture<RandomStringDto> getRandomString() async {
    try {
      final result = await _testServices.getRandomString();
      Dev.log.i("result :$result");

      return Right(result);
    } catch (error) {
      Dev.log.e("error :$error");

      return const Left(ApiFailure());
    }
  }
}
