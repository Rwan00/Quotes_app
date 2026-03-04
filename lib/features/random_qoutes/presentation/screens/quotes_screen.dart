import 'package:flutter/material.dart';
import 'package:qoutes/core/utils/app_colors.dart';
import 'package:qoutes/features/random_qoutes/presentation/widgets/quote_card.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  Widget _buildBodyContent() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          QuoteCard(quote: "Test", author: "Text"),
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor,
            ),
            child: Icon(Icons.refresh, color: Colors.white, size: 28),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quotes")),
      body: _buildBodyContent(),
    );
  }
}
