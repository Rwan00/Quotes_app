
import 'package:qoutes/core/api/api_consumer.dart';

import 'package:qoutes/core/api/endpoints.dart';

import 'package:qoutes/features/random_qoutes/data/models/quote_model.dart';

abstract class QuoteRemoteDatasource {
  Future<QuoteModel> getRandomQuote();
}

class QuoteRemoteDatasourceImpl implements QuoteRemoteDatasource {
  ApiConsumer apiConsumer;
  QuoteRemoteDatasourceImpl({required this.apiConsumer});

  @override
  Future<QuoteModel> getRandomQuote() async {
   
    final response = await apiConsumer.get(
      Endpoints.randomQuote,
     
    );
     return QuoteModel.fromJson(response);
  }
}
