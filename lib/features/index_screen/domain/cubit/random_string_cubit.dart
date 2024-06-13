// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/features/index_screen/domain/repository/i_random_string_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'random_string_cubit.freezed.dart';
part 'random_string_state.dart';

class RandomStringCubit extends Cubit<RandomStringState> {
  final IRansomStringRepository _ransomStringRepository;
  RandomStringCubit(this._ransomStringRepository) : super(RandomStringState()) {
    getRandomString();
  }

  getRandomString() async {
    emit(state.copyWith(isLoading: true));
    final result = await _ransomStringRepository.getRandomString();
    result.fold((error) {
      emit(
        state.copyWith(randomString: error.errorMesage),
      );
    }, (randomString) {
      emit(state.copyWith(randomString: randomString.randomString));
    });
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(isLoading: false));
  }
}
