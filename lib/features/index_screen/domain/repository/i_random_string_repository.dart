import 'package:flutter_exam/core/utils/typedef.dart';

abstract class IRansomStringRepository {
  ResultFuture<String> getRandomString();
}
