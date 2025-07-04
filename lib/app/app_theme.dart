import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightThemeData {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors.getMaterialColor(AppColors.themeColor),
      ),

      /// Text Theme
        ///
      textTheme: _textTheme,

      /// TextFormField theme

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
        border: _getInputBorder(AppColors.themeColor),
        enabledBorder: _getInputBorder(AppColors.themeColor),
        focusedBorder: _getInputBorder(AppColors.themeColor),
        errorBorder: _getInputBorder(Colors.red),
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.grey
        )
      ),



      /// Elevated button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r) )),
            fixedSize: WidgetStatePropertyAll(Size.fromWidth(double.maxFinite)),
            backgroundColor: WidgetStatePropertyAll(AppColors.themeColor),
            foregroundColor: WidgetStatePropertyAll(Colors.white),
            textStyle: WidgetStatePropertyAll(TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              letterSpacing: .4,
            ))
        ),
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(fontSize: 16.sp,color: Colors.black87),
        iconTheme: IconThemeData( color: Colors.black87, size: 20.r),

      ),

    );
  }

  static OutlineInputBorder _getInputBorder(Color color,) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 1.2.w));
  }

  static TextTheme get _textTheme {
    return TextTheme(
      titleLarge: TextStyle(
        letterSpacing: .4,
        fontSize: 28.sp,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        letterSpacing: .4,
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        letterSpacing: .4,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(fontSize: 16.sp, color: Colors.grey),
    );
  }
}
