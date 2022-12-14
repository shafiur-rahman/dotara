import 'package:dotara/views/AlbumDetails.dart';
import 'package:dotara/views/EventDetails.dart';
import 'package:dotara/views/Home.dart';
import 'package:dotara/views/Intro.dart';
import 'package:dotara/views/LogIn.dart';
import 'package:dotara/views/MusicCategorySelect.dart';
import 'package:dotara/views/MusicPlayer.dart';
import 'package:dotara/views/SignUp.dart';
import 'package:dotara/views/SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants/RoutingConstants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreenRoute:
      return MaterialPageRoute(
          settings: settings, builder: (context) => SplashScreen());
    case HomeRoute:
      return MaterialPageRoute(
          settings: settings, builder: (context) => Home());
    case SignUpRoute:
      return MaterialPageRoute(
          settings: settings, builder: (context) => SignUp());
    case EventDetailsRoute:
      return MaterialPageRoute(
          settings: settings, builder: (context) => EventDetails());

    case LogInRoute:
      return MaterialPageRoute(
          settings: settings, builder: (context) => LogIn());
    case IntroRoute:
      return MaterialPageRoute(
          settings: settings, builder: (context) => Intro());
    case MusicCategorySelectRoute:
      return MaterialPageRoute(
          settings: settings, builder: (context) => MusicCategorySelect());

    case AlbumDetailsRoute:
      return MaterialPageRoute(
          settings: settings, builder: (context) => AlbumDetails(settings.arguments));

    case MusicPlayerRoute:
      return MaterialPageRoute(
          settings: settings, builder: (context) => MusicPlayer(settings.arguments));

  }
}
