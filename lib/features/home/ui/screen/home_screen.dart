import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app_ostad/app/assets_path.dart';
import 'package:e_commerce_app_ostad/features/home/ui/widgets/appbar_icon.dart';
import 'package:e_commerce_app_ostad/features/home/ui/widgets/home_carosalslider.dart';
import 'package:e_commerce_app_ostad/features/home/ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static final String name ="/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
        child: Column(
          children: [
            HomeSearchBar(),
            SizedBox(height: 12,),
            Home_Carosalslider()

          ],
        ),
      ),

    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navAppLogoSvg, width: 135,),
      actions: [
        AppbarIcon(iconData: Icons.person,onTap: (){},),
        AppbarIcon(iconData: Icons.call,onTap: (){},),
        AppbarIcon(iconData: Icons.notifications_none,onTap: (){},),
      ],
    );
  }
}




