import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/app/app_theme.dart';
import 'package:flutter_exam/core/app_router.dart';
import 'package:flutter_exam/features/index_screen/data/repository/random_string_repository.dart';
import 'package:flutter_exam/features/index_screen/domain/cubit/random_string_cubit.dart';
import 'package:flutter_exam/features/index_screen/domain/repository/i_random_string_repository.dart';
import 'package:flutter_exam/services/test_services.dart';

class App extends StatefulWidget {
  final String baseUrl;
  const App({super.key, required this.baseUrl});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppRouter _appRouter;
  late TestServices _testServices;
  late Dio _dio;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appRouter = AppRouter();
    _dio = _dioSetup();
    _testServices = TestServices(_dio);
  }

  _dioSetup() {
    BaseOptions baseOptions = BaseOptions(
        connectTimeout: const Duration(seconds: 60), receiveTimeout: const Duration(seconds: 60), maxRedirects: 3, baseUrl: widget.baseUrl);

    Dio dio = Dio(baseOptions);
    dio.interceptors.addAll([ApiInterceptor()]);
    return dio;
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IRansomStringRepository>.value(
      value: RandomStringRepository(_testServices),
      child: BlocProvider(
        create: (context) => RandomStringCubit(context.read<IRansomStringRepository>()),
        child: MaterialApp.router(
          theme: AppTheme.getInstance().getTheme(),
          routerConfig: _appRouter.config(),
        ),
      ),
    );
  }
}

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // set cancellation token to all requests
    options.cancelToken = DioCancellationTokens.instance._all;

    options.contentType = 'application/json';
    options.headers.clear();

    options.headers.addAll(<String, String?>{
      'Content-Type': 'application/json',
      // 'AuthKey': token,
    });
    super.onRequest(options, handler);
  }
}

class DioCancellationTokens {
  factory DioCancellationTokens() {
    return _singleton;
  }

  DioCancellationTokens._internal();

  static DioCancellationTokens instance = DioCancellationTokens();

  static final DioCancellationTokens _singleton = DioCancellationTokens._internal();

  CancelToken _all = CancelToken();

  void renewCancelToken() {
    _all = CancelToken();
  }
}
