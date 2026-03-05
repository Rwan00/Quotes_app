import 'package:dartz/dartz.dart';
import 'package:qoutes/core/error/failure.dart';
import 'package:qoutes/core/usecases/usecase.dart';
import 'package:qoutes/features/random_qoutes/domain/entities/quote_entity.dart';
import 'package:qoutes/features/random_qoutes/domain/repositories/quote_repository.dart';

class GetRandomQuoteUsecase implements UseCase<QuoteEntity, NoParams> {
  final QuoteRepository _quoteRepository;

  GetRandomQuoteUsecase({required QuoteRepository quoteRepository}) : _quoteRepository = quoteRepository;
  @override
  Future<Either<Failure, QuoteEntity>> call(NoParams params) {
    return _quoteRepository.getRandomQuote();
  }
}
