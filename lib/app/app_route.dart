import 'package:e_commerce_app_ostad/features/auth/ui/screens/login_screen.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/screens/sign_up_screen.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/screens/splash_screen.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:e_commerce_app_ostad/features/common/ui/screen/main_bottom_nav.dart';
import 'package:e_commerce_app_ostad/features/products/ui/screen/create_review_screen.dart';
import 'package:e_commerce_app_ostad/features/products/ui/screen/product_details_screen.dart';
import 'package:e_commerce_app_ostad/features/products/ui/screen/product_list_screen.dart';
import 'package:e_commerce_app_ostad/features/products/ui/screen/review_screen.dart';
import 'package:e_commerce_app_ostad/features/wishList/ui/screen/wish_list_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic> routes(RouteSettings settings) {
    late final Widget screenWidgets;

    if (settings.name == SplashScreen.name) {
      screenWidgets = SplashScreen();
    } else if (settings.name == LoginScreen.name) {
      screenWidgets = LoginScreen();
    } else if (settings.name == SignUpScreen.name) {
      screenWidgets = SignUpScreen();
    } else if (settings.name == MainBottomNav.name) {
      screenWidgets = MainBottomNav();
    } else if (settings.name == ProductListScreen.name) {
      final String category = settings.arguments as String;
      screenWidgets = ProductListScreen(category: category);
    }else if(settings.name==ProductDetailsScreen.name){
      final String productId = settings.arguments as String;
      screenWidgets = ProductDetailsScreen(productId: productId,);
    }else if(settings.name==ReviewScreen.name){
      screenWidgets =ReviewScreen();
    } else if(settings.name==CreateReviewScreen.name){
      screenWidgets = CreateReviewScreen();
    }else if(settings.name==VerifyOtpScreen.name){
      final String email = settings.arguments as String;
      screenWidgets = VerifyOtpScreen(email: email,);
    }
    return MaterialPageRoute(builder: (context) => screenWidgets);
  }
}
