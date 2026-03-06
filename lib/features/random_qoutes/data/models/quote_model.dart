import 'package:qoutes/features/random_qoutes/domain/entities/quote_entity.dart';

class QuoteModel extends QuoteEntity {
  const QuoteModel({
    required super.author,
    required super.id,
    required super.quote,
    required super.permaLink,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      author: json["author"],
      id: json["id"],
      quote: json["quote"],
      permaLink: json["permalink"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "author":author,
      "id":id,
      "quote":quote,
      "permalink":permaLink,
    };
  }
}
