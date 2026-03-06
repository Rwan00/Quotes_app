

import 'package:qoutes/features/random_qoutes/data/models/quote_model.dart';

abstract class QuoteRemoteDatasource {
  Future<QuoteModel> getRandomQuote();
}
