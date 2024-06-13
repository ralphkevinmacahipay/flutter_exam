import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'random_string_state.dart';
part 'random_string_cubit.freezed.dart';

class RandomStringCubit extends Cubit<RandomStringState> {
  RandomStringCubit() : super(RandomStringState());
}
