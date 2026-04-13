import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:qoutes/core/api/app_interceptors.dart';
import 'package:qoutes/core/network/network_info.dart';
import 'package:qoutes/features/random_qoutes/data/datasource/quote_local_datasource.dart';
import 'package:qoutes/features/random_qoutes/data/datasource/quote_remote_datasource.dart';
import 'package:qoutes/features/random_qoutes/data/repositories_implementation/quote_repo_impl.dart';
import 'package:qoutes/features/random_qoutes/domain/repositories/quote_repository.dart';
import 'package:qoutes/features/random_qoutes/domain/usecases/get_random_quote_usecase.dart';
import 'package:qoutes/features/random_qoutes/presentation/cubit/quotes_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:http/http.dart" as http;

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  //Blocs
  sl.registerFactory<QuotesCubit>(() => QuotesCubit(quoteUsecase: sl()));

  //UseCases
  sl.registerLazySingleton<GetRandomQuoteUsecase>(
    () => GetRandomQuoteUsecase(quoteRepository: sl()),
  );

  //Ripository
  sl.registerLazySingleton<QuoteRepository>(
    () => QuoteRepoImpl(
      quoteLocalDatasource: sl(),
      quoteRemoteDatasource: sl(),
      networkInfo: sl(),
    ),
  );

  //DataSources
  sl.registerLazySingleton<QuoteLocalDatasource>(
    () => QuoteLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<QuoteRemoteDatasource>(
    () => QuoteRemoteDatasourceImpl(client: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(internetConnectionChecker: sl()),
  );

  //! External
  final sharedPreference = await SharedPreferences.getInstance();
  final connectionChecker = InternetConnectionChecker.createInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreference);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
    request: true,
    requestBody: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: true,
    error: true,
  ));
  sl.registerLazySingleton(() => connectionChecker);
}
