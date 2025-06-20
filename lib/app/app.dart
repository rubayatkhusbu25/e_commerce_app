import 'package:e_commerce_app_ostad/app/app_route.dart';
import 'package:e_commerce_app_ostad/app/controller_binder.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app_theme.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'E-commerce App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightThemeData, //theme
          initialRoute: SplashScreen.name,
          onGenerateRoute: AppRoute.routes, // Named Routes used with onGenerate
        initialBinding: ControllerBinder(),
        );
      },
    );
  }
}
