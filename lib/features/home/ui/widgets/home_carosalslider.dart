import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app_ostad/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCarosalslider extends StatefulWidget {
  const HomeCarosalslider({super.key});

  @override
  State<HomeCarosalslider> createState() => _HomeCarosalsliderState();
}

class _HomeCarosalsliderState extends State<HomeCarosalslider> {
  final ValueNotifier<int> _currentSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            //autoPlayAnimationDuration: Duration(seconds: 2),
            // animateToClosest: true,
            //reverse: true,
            height: 150.h,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            onPageChanged: (int _currentIndex, _) {
              _currentSlider.value = _currentIndex;
            },
          ),

          items:
              [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: BoxDecoration(
                        color: AppColors.themeColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          'text $i',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
        ),

        ValueListenableBuilder(
          valueListenable: _currentSlider,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 5; i++)
                  Container(
                    width: 12.w,
                    height: 12.h,
                    margin: EdgeInsets.only(left: 2.w),
                    decoration: BoxDecoration(
                      color:
                          index == i
                              ? AppColors.themeColor
                              : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.grey.shade400, width: 1.w),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
