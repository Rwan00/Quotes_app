import 'package:flutter/material.dart';
import 'package:qoutes/config/routes/app_routes.dart';
import 'package:qoutes/config/themes/app_theme.dart';


class QoutesApp extends StatelessWidget {
  const QoutesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
     onGenerateRoute: AppRoutes.onGenerateRoute,
initialRoute: Routes.initialRoute,
    );
  }
}
