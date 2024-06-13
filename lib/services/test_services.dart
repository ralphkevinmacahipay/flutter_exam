import 'package:dio/dio.dart';
import 'package:flutter_exam/features/index_screen/data/model/random_string_dto.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
part "test_services.g.dart";

@RestApi(baseUrl: '/')
abstract class TestServices {
  factory TestServices(Dio dio, {String baseUrl}) = _TestServices;

  @RestApi(baseUrl: "https://o7q6ka26qs232rmbtpbrxghy6u0vyrup.lambda-url.ap-southeast-1.on.aws")
  @GET("/")
  Future<RandomStringDto> getRandomString();
}
