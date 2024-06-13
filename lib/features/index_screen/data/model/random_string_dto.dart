import 'package:json_annotation/json_annotation.dart';
part 'random_string_dto.g.dart';

@JsonSerializable()
class RandomStringDto {
  RandomStringDto({this.randomString});

  factory RandomStringDto.fromJson(Map<String, dynamic> json) => _$RandomStringDtoFromJson(json);

  // Uncomment the line below to generate the `toJson` method
  Map<String, dynamic> toJson() => _$RandomStringDtoToJson(this);

  final String? randomString;
}
