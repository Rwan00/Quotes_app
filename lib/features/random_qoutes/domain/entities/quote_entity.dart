import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  final String author;

  final String quote;
 

  const QuoteEntity({
    required this.author,
   
    required this.quote,

  });

  @override
  List<Object?> get props => [author,  quote, ];
}
