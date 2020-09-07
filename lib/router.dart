

import 'package:dotara/views/Home.dart';
import 'package:dotara/views/SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants/RoutingConstants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreenRoute:
      return MaterialPageRoute(
          settings: settings, builder: (context) => SplashScreen());


case SplashScreenRoute:
return MaterialPageRoute(
settings: settings, builder: (context) => SplashScreen());
case HomeRoute:
return MaterialPageRoute(
settings: settings, builder: (context) => Home());

  }
}