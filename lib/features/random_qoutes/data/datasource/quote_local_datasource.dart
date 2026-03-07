import 'dart:convert';

import 'package:qoutes/core/error/exceptions.dart';
import 'package:qoutes/core/utils/app_consts.dart';
import 'package:qoutes/features/random_qoutes/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class QuoteLocalDatasource {
  Future<void> cacheQuote(QuoteModel quote);
  Future<QuoteModel> getLastRandomQuote();
}

class QuoteLocalDataSourceImpl implements QuoteLocalDatasource {
  final SharedPreferences sharedPreferences;

  QuoteLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> cacheQuote(QuoteModel quote) {
    return sharedPreferences.setString(
      AppConsts.cachedRandomQuote,
      json.encode(quote),
    );
  }

  @override
  Future<QuoteModel> getLastRandomQuote() {
    final jsonString = sharedPreferences.getString(AppConsts.cachedRandomQuote);
    if (jsonString != null) {
      final cacheRandomQuote = Future.value(
        QuoteModel.fromJson(json.decode(jsonString)),
      );
      return cacheRandomQuote;
    } else {
      throw CacheException();
    }
  }
}
