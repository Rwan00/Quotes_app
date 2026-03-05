import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  final String author;
  final int id;
  final String quote;
  final String permaLink;

  const QuoteEntity({
    required this.author,
    required this.id,
    required this.quote,
    required this.permaLink,
  });

  @override
  List<Object?> get props => [author, id, quote, permaLink];
}
