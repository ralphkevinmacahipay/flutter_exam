import 'package:flutter_exam/core/utils/typedef.dart';
import 'package:flutter_exam/features/index_screen/data/model/random_string_dto.dart';

abstract class IRansomStringRepository {
  ResultFuture<RandomStringDto> getRandomString();
}
