import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app_ostad/app/app_colors.dart';
import 'package:e_commerce_app_ostad/app/app_theme.dart';
import 'package:e_commerce_app_ostad/app/assets_path.dart';
import 'package:e_commerce_app_ostad/features/common/controllers/main_bottom_nav_controller.dart';
import 'package:e_commerce_app_ostad/features/home/ui/widgets/appbar_icon.dart';
import 'package:e_commerce_app_ostad/features/home/ui/widgets/home_carosalslider.dart';
import 'package:e_commerce_app_ostad/features/common/ui/widgets/product_category_item.dart';
import 'package:e_commerce_app_ostad/features/home/ui/widgets/search_bar.dart';
import 'package:e_commerce_app_ostad/features/products/ui/screen/product_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});



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
            HomeCarosalslider(),
            _buildSectionHeader(title: "Categories",onTapSeeAll: (){
              // Navigator.pushNamed(context, ProductCategory.name);
              Get.find<MainBottomNavController>().moveToIndex();
            }),
            _getListCategorySection(),
            _buildSectionHeader(title: "Popular",onTapSeeAll: (){}),
            _buildSectionHeader(title: "Special",onTapSeeAll: (){}),
            _buildSectionHeader(title: "New",onTapSeeAll: (){}),

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

  Widget _buildSectionHeader({required String title, required VoidCallback onTapSeeAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Theme.of(context).textTheme.titleSmall,),
        TextButton(onPressed: onTapSeeAll, child: Text("See all"))
      ],
    );
  }

  Widget _getListCategorySection(){
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
          itemBuilder: (context,index){
            return ProductCategoryItem();


      }, separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 10);
      },),
    );
  }


}




