import 'package:dartz/dartz.dart';
import 'package:qoutes/core/error/exceptions.dart';
import 'package:qoutes/core/error/failure.dart';
import 'package:qoutes/features/splash/data/datasources/lang_locale_datasource.dart';
import 'package:qoutes/features/splash/domain/repositories/lang_repository.dart';

class LangRepositoryImpl implements LangRepository {
  final LangLocaleDatasource langLocaleDatasource;

  LangRepositoryImpl({required this.langLocaleDatasource});
  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final langIsChanged = await langLocaleDatasource.changeLang(
        langCode: langCode,
      );
      return Right(langIsChanged);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langCode = await langLocaleDatasource.getSavedLang();
      return Right(langCode);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
