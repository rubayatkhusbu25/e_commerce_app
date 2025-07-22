import 'package:e_commerce_app_ostad/features/auth/ui/widgets/app_logo.dart';
import 'package:e_commerce_app_ostad/features/common/controllers/auth_controller.dart';
import 'package:e_commerce_app_ostad/features/common/ui/screen/main_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static final String name = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Get.find<AuthController>().getUserData();

    Navigator.pushReplacementNamed(context, MainBottomNav.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              Spacer(),
              AppLogo(),
              Spacer(),
              CircularProgressIndicator(),
              SizedBox(height: 16.h),
              Text("Version 1.0.0", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
