import 'package:e_commerce_app_ostad/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoute {

  static Route<dynamic> routes( RouteSettings settings){
    late final Widget screenWidgets;

    if (settings.name == SplashScreen.name) {
      screenWidgets = SplashScreen();
    }
    return MaterialPageRoute(builder: (context) => screenWidgets);

  }
}