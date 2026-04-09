import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoutes/core/error/failure.dart';
import 'package:qoutes/core/usecases/usecase.dart';
import 'package:qoutes/features/random_qoutes/domain/entities/quote_entity.dart';
import 'package:qoutes/features/random_qoutes/domain/usecases/get_random_quote_usecase.dart';
part 'quotes_state.dart';

class QuotesCubit extends Cubit<QuotesState> {
  final GetRandomQuoteUsecase quoteUsecase;
  QuotesCubit({required this.quoteUsecase}) : super(QuotesInitial());

  Future<void> getRandomQuotes() async {
    Either<Failure, QuoteEntity> response = await quoteUsecase(NoParams());

    emit(
      response.fold(
        (failure) => QuotesError(errorMsg: _mapFailureToMsg(failure)),
        (quote) => QuotesLoaded(quote: quote),
      ),
    );
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return "Server Failure";
      case CacheFailure _:
        return "Cache Failure";
      default:
        return "Unexpected Error";
    }
  }
}
