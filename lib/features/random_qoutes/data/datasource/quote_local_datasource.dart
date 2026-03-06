import 'package:qoutes/features/random_qoutes/data/models/quote_model.dart';


abstract class QuoteLocalDatasource {
  Future<QuoteModel> getLastRandomQuote();
  Future<void> cacheQuote(QuoteModel quote);
}
