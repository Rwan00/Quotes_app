import 'package:dartz/dartz.dart';
import 'package:qoutes/core/error/failure.dart';
import 'package:qoutes/features/random_qoutes/domain/entities/quote_entity.dart';

abstract class QuoteRepository {
  Future<Either<Failure, QuoteEntity>> getRandomQuote();
}
