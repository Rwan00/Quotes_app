part of 'quotes_cubit.dart';

sealed class QuotesState extends Equatable {
  const QuotesState();

  @override
  List<Object> get props => [];
}

final class QuotesInitial extends QuotesState {}

final class QuotesisLoading extends QuotesState {}

final class QuotesLoaded extends QuotesState {
  final QuoteEntity quote;
  const QuotesLoaded({required this.quote});

  @override
  List<Object> get props => [quote];
}

class QuotesError extends QuotesState {
  final String errorMsg;

  const QuotesError({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
