// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:qoutes/core/utils/app_colors.dart';

class QuoteCard extends StatelessWidget {
  final String quote;
  final String author;
  const QuoteCard({super.key, required this.quote, required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.primaryColor,
      ),
      child: Column(
        children: [
          Text(
            quote,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 12),
          Text(
            "_ $author",
            textAlign: TextAlign.center,

            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
