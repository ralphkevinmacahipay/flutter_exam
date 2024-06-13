part of 'random_string_cubit.dart';

@freezed
class RandomStringState with _$RandomStringState {
  factory RandomStringState({
    @Default(false) bool isLoading,
    @Default("") String randomString,
  }) = _RandomStringInitial;
}
