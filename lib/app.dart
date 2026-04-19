import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoutes/config/locale/app_localizations_setup.dart';
import 'package:qoutes/config/routes/app_routes.dart';
import 'package:qoutes/config/themes/app_theme.dart';
import 'package:qoutes/features/splash/presentation/cubit/locale_cubit.dart';
import "injection_container.dart" as di;

class QoutesApp extends StatelessWidget {
  const QoutesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<LocaleCubit>(),
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previousState, currentState) {
          return previousState != currentState;
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            initialRoute: Routes.initialRoute,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
          );
        },
      ),
    );
  }
}
