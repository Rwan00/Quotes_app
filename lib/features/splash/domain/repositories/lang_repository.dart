import 'package:dartz/dartz.dart';
import 'package:qoutes/core/error/failure.dart';

abstract class LangRepository {
  Future<Either<Failure, bool>> changeLang({required String langCode});
  Future<Either<Failure, String>> getSavedLang();
}
