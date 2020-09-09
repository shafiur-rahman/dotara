import 'package:audio_service/audio_service.dart';
import 'package:dotara/router.dart';
import 'package:dotara/values/ColorsLocal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'constants/RoutingConstants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.grey[900],
    statusBarIconBrightness: Brightness.dark,
//    systemNavigationBarColor: Colors.white,
//    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//    systemNavigationBarColor: Colors.white,
//    systemNavigationBarIconBrightness: Brightness.dark,
//  ));

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp( AudioServiceWidget(
      child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: Get.key,
            initialRoute: SplashScreenRoute,
            onGenerateRoute: generateRoute,

            theme: ThemeData(

              //accentColor: Colors.pink[400],
              //primaryColor: Colors.pink,
              primarySwatch: Colors.pink,
              scaffoldBackgroundColor:
              ColorsLocal.hexToColor("222222"),
              //visualDensity: VisualDensity.adaptivePlatformDensity,
              appBarTheme: AppBarTheme(
                  elevation: 1,
                  brightness: Brightness.dark,
                  centerTitle: false,
                  color: ColorsLocal.hexToColor("222222"),
                  iconTheme: IconThemeData(
                    color: Colors.grey[800],
                  )),
            )),
    ),
    );
  });
}