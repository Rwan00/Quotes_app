import 'package:dartz/dartz.dart';
import 'package:qoutes/core/error/failure.dart';
import 'package:qoutes/core/usecases/usecase.dart';
import 'package:qoutes/features/random_qoutes/domain/entities/quote_entity.dart';

class GetRandomQuoteUsecase implements UseCase<QuoteEntity,NoParams>{
  @override
  Future<Either<Failure, QuoteEntity>> call(NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}