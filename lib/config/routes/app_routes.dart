import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoutes/features/random_qoutes/presentation/cubit/quotes_cubit.dart';

import 'package:qoutes/features/random_qoutes/presentation/screens/quotes_screen.dart';

class Routes {
  static const String initialRoute = "Quotes Screen";
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => QuotesCubit(quoteUsecase: null),
            child: QuotesScreen(),
          ),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) =>
          const Scaffold(body: Center(child: Text("No Route Found"))),
    );
  }
}
