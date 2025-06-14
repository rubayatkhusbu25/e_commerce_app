import 'package:e_commerce_app_ostad/features/auth/ui/screens/login_screen.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/screens/sign_up_screen.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {

  static Route<dynamic> routes( RouteSettings settings){
    late final Widget screenWidgets;

    if (settings.name == SplashScreen.name) {
      screenWidgets = SplashScreen();
    }else if(settings.name == LoginScreen.name){
      screenWidgets =LoginScreen();
    }else if(settings.name == SignUpScreen.name){
      screenWidgets = SignUpScreen();
    }
    return MaterialPageRoute(builder: (context) => screenWidgets);

  }
}