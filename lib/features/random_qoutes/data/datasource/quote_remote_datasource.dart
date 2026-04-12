// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import "package:http/http.dart" as http;

import 'package:qoutes/core/api/endpoints.dart';
import 'package:qoutes/core/error/exceptions.dart';
import 'package:qoutes/features/random_qoutes/data/models/quote_model.dart';

abstract class QuoteRemoteDatasource {
  Future<QuoteModel> getRandomQuote();
}

class QuoteRemoteDatasourceImpl implements QuoteRemoteDatasource {
  http.Client client;
  QuoteRemoteDatasourceImpl({required this.client});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final rendomQuoteUrl = Uri.parse(Endpoints.randomQuote);
    final response = await client.get(
      rendomQuoteUrl,
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      log("success");
      log(response.body);
      return QuoteModel.fromJson(json.decode(response.body));
    } else {
      log("failed");
      throw ServerException();
    }
  }
}
