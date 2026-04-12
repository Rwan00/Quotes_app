import 'package:qoutes/features/random_qoutes/domain/entities/quote_entity.dart';

class QuoteModel extends QuoteEntity {
  const QuoteModel({
    required super.author,
  
    required super.quote,
  
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      author: json["author"],
    
      quote: json["quote"],
     
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "author":author,
 
      "quote":quote,
    
    };
  }
}
