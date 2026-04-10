import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qoutes/core/utils/app_colors.dart';
import 'package:qoutes/core/widgets/custom_error_widget.dart';
import 'package:qoutes/features/random_qoutes/presentation/cubit/quotes_cubit.dart';
import 'package:qoutes/features/random_qoutes/presentation/widgets/quote_card.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  Widget _buildBodyContent() {
    return BlocBuilder<QuotesCubit, QuotesState>(
      builder: (context, state) {
         if (state is QuotesError) {
          return CustomErrorWidget(onPressed:()=> context.read<QuotesCubit>().getRandomQuotes(),);
        }
        else if(state is QuotesLoaded){
return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              QuoteCard(quote: state.quote),
              GestureDetector(
                onTap: ()=>context.read<QuotesCubit>().getRandomQuotes(),
                child: Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: Icon(Icons.refresh, color: Colors.white, size: 28),
                ),
              ),
            ],
          ),
        );
        }else{
         return Center(
            child: SpinKitFadingCircle(
              color: AppColors.primaryColor,
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.red : Colors.green,
                  ),
                );
              },
            ),
          );
        }
        
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => BlocProvider.of<QuotesCubit>(context).getRandomQuotes(),
      child: Scaffold(
        appBar: AppBar(title: Text("Quotes")),
        body: _buildBodyContent(),
      ),
    );
  }
}
