import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/routing/routes.dart';
import 'package:weather/features/auth/data/cubit/sign_in_cubit.dart';
import 'package:weather/features/auth/data/cubit/sign_up_cubit.dart';
import 'package:weather/features/auth/ui/sign_in_view.dart';
import 'package:weather/features/auth/ui/sign_up_view.dart';
import 'package:weather/features/home/home_page.dart';
import 'package:weather/features/home/ui/views/forecast_report_view.dart';
import 'package:weather/features/onboarding/onboarding.dart';
import 'package:weather/features/search/data/models/seven_day_model.dart';
import 'package:weather/features/search/search_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePageRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.signUpRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SignUpCubit(),
                  child: const SignUpView(),
                ));
      case Routes.signInRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SignInCubit(),
                  child: const SignInView(),
                ));
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case Routes.searchPageRoute:
        return MaterialPageRoute(builder: (_) => const SearchPage());
      case Routes.forecastPageRoute:
        final sevenDaysWeatherModel =
            settings.arguments as SevenDaysWeatherModel; // Get the argument
        return MaterialPageRoute(
            builder: (_) => ForecastReportPage(
                sevenDaysWeatherModel: sevenDaysWeatherModel));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Text('the ${settings.name} doesn\'t exist '),
          ),
        );
    }
  }
}
