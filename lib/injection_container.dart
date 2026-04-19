import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:qoutes/core/api/api_consumer.dart';
import 'package:qoutes/core/api/app_interceptors.dart';
import 'package:qoutes/core/api/dio_consumer.dart';
import 'package:qoutes/core/network/network_info.dart';
import 'package:qoutes/features/random_qoutes/data/datasource/quote_local_datasource.dart';
import 'package:qoutes/features/random_qoutes/data/datasource/quote_remote_datasource.dart';
import 'package:qoutes/features/random_qoutes/data/repositories_implementation/quote_repo_impl.dart';
import 'package:qoutes/features/random_qoutes/domain/repositories/quote_repository.dart';
import 'package:qoutes/features/random_qoutes/domain/usecases/get_random_quote_usecase.dart';
import 'package:qoutes/features/random_qoutes/presentation/cubit/quotes_cubit.dart';
import 'package:qoutes/features/splash/data/datasources/lang_locale_datasource.dart';
import 'package:qoutes/features/splash/data/repositories/lang_repository_impl.dart';
import 'package:qoutes/features/splash/domain/repositories/lang_repository.dart';
import 'package:qoutes/features/splash/domain/usecases/change_lang_usecase.dart';
import 'package:qoutes/features/splash/domain/usecases/get_saved_lang_usecase.dart';
import 'package:qoutes/features/splash/presentation/cubit/locale_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:http/http.dart" as http;

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  //Blocs
  sl.registerFactory<QuotesCubit>(() => QuotesCubit(quoteUsecase: sl()));

  sl.registerFactory<LocaleCubit>(
    () => LocaleCubit(changeLangUseCase: sl(), getSavedLangUsecase: sl()),
  );

  //UseCases
  sl.registerLazySingleton<GetRandomQuoteUsecase>(
    () => GetRandomQuoteUsecase(quoteRepository: sl()),
  );

  sl.registerLazySingleton<GetSavedLangUsecase>(
    () => GetSavedLangUsecase(langRepository: sl()),
  );
  sl.registerLazySingleton<ChangeLangUseCase>(
    () => ChangeLangUseCase(langRepository: sl()),
  );

  //Ripository
  sl.registerLazySingleton<QuoteRepository>(
    () => QuoteRepoImpl(
      quoteLocalDatasource: sl(),
      quoteRemoteDatasource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<LangRepository>(
    () => LangRepositoryImpl(
      langLocaleDatasource: sl()
    ),
  );

  //DataSources
  sl.registerLazySingleton<QuoteLocalDatasource>(
    () => QuoteLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<QuoteRemoteDatasource>(
    () => QuoteRemoteDatasourceImpl(apiConsumer: sl()),
  );

  sl.registerLazySingleton<LangLocaleDatasource>(
    () => LangLocaleDatasourceImpl(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(internetConnectionChecker: sl()),
  );
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  //! External
  final sharedPreference = await SharedPreferences.getInstance();
  final connectionChecker = InternetConnectionChecker.createInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreference);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );
  sl.registerLazySingleton(() => connectionChecker);
  sl.registerLazySingleton(() => Dio());
}
