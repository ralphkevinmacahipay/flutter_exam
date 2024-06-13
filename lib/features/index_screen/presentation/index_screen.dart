import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/core/utils/logger.dart';
import 'package:flutter_exam/features/index_screen/domain/cubit/random_string_cubit.dart';

@RoutePage()
class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: BlocBuilder<RandomStringCubit, RandomStringState>(
          builder: (context, state) {
            if (state.isLoading) return const Center(child: CircularProgressIndicator.adaptive());
            return Text(
              state.randomString!,
              style: theme.textTheme.displaySmall,
            );
          },
        ),
      ),
    );
  }
}
