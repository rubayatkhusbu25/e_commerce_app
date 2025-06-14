import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app_ostad/app/assets_path.dart';
import 'package:e_commerce_app_ostad/features/home/ui/widgets/appbar_icon.dart';
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
            SearchBar(),
            CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: [1,2,3,4,5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber
                        ),
                        child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                    );
                  },
                );
              }).toList(),
            )

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



