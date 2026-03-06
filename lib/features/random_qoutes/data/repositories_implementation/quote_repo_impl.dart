import 'package:dartz/dartz.dart';
import 'package:qoutes/core/error/failure.dart';
import 'package:qoutes/core/network/network_info.dart';
import 'package:qoutes/features/random_qoutes/data/datasource/quote_local_datasource.dart';
import 'package:qoutes/features/random_qoutes/data/datasource/quote_remote_datasource.dart';
import 'package:qoutes/features/random_qoutes/domain/entities/quote_entity.dart';
import 'package:qoutes/features/random_qoutes/domain/repositories/quote_repository.dart';

class QuoteRepoImpl implements QuoteRepository {
  final NetworkInfo networkInfo;
  final QuoteRemoteDatasource quoteRemoteDatasource;
  final QuoteLocalDatasource quoteLocalDatasource;

  QuoteRepoImpl({
    required this.networkInfo,
    required this.quoteRemoteDatasource,
    required this.quoteLocalDatasource,
  });

  @override
  Future<Either<Failure, QuoteEntity>> getRandomQuote() async{
    if(await networkInfo.isConnected){
      
    }
  
  }
  }

