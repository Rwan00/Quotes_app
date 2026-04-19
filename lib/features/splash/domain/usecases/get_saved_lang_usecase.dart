import 'package:dartz/dartz.dart';
import 'package:qoutes/core/error/failure.dart';
import 'package:qoutes/core/usecases/usecase.dart';
import 'package:qoutes/features/splash/domain/repositories/lang_repository.dart';

class GetSavedLangUsecase implements UseCase<String, NoParams> {
  final LangRepository langRepository;

  GetSavedLangUsecase({required this.langRepository});
  @override
  Future<Either<Failure, String>> call(NoParams params) async =>
      await langRepository.getSavedLang();
}
