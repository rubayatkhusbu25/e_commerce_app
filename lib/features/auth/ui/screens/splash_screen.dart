import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});


  static final String name= "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.all(16.r),
          child: Column(
            children: [
              Spacer(),
              SvgPicture.asset("assets/images/logo.svg"),
              Spacer(),
              CircularProgressIndicator(),
              SizedBox(height: 16.h,),
              Text("Version 1.0.0",style: TextStyle(color: Colors.grey),)
            ],
          ),
        ),
      )

    );
  }
}
