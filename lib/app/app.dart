import 'package:e_commerce_app_ostad/app/app_route.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce App',
      theme: AppTheme.lightThemeData,  //theme
      initialRoute: SplashScreen.name,
      onGenerateRoute: AppRoute.routes, // Named Routes used with onGenerate
      // routes: {
      //   SplashScreen.name: (context)=> SplashScreen()
      //
      // },
    );
  }
}
