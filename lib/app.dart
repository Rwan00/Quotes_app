import 'package:flutter/material.dart';
import 'package:qoutes/core/utils/app_colors.dart';
import 'package:qoutes/features/random_qoutes/presentation/screens/quotes_screen.dart';

class QoutesApp extends StatelessWidget {
  const QoutesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      home: QuotesScreen(),
    
    );
  }
}
