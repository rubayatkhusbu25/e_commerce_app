import 'package:e_commerce_app_ostad/app/assets_path.dart';
import 'package:e_commerce_app_ostad/core/ui/widgets/center_circular_progressbar.dart';
import 'package:e_commerce_app_ostad/features/common/controllers/category_list_controller.dart';
import 'package:e_commerce_app_ostad/features/common/controllers/main_bottom_nav_controller.dart';
import 'package:e_commerce_app_ostad/features/home/ui/controller/home_slider_controller.dart';
import 'package:e_commerce_app_ostad/features/home/ui/controller/new_product_list_controller.dart';
import 'package:e_commerce_app_ostad/features/home/ui/controller/popular_product_list_controller.dart';
import 'package:e_commerce_app_ostad/features/home/ui/controller/spcial_product_list_controller.dart';
import 'package:e_commerce_app_ostad/features/home/ui/widgets/appbar_icon.dart';
import 'package:e_commerce_app_ostad/features/home/ui/widgets/home_carosalslider.dart';
import 'package:e_commerce_app_ostad/features/common/ui/widgets/product_category_item.dart';
import 'package:e_commerce_app_ostad/features/common/ui/widgets/product_card.dart';
import 'package:e_commerce_app_ostad/features/home/ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeSearchBar(),
              SizedBox(height: 5.h,),
              GetBuilder<HomeSliderController>(
                builder: (homeSlider) {
                  if(homeSlider.inProgress){
                    return SizedBox(
                      height: 192.h,
                        child: CenterCircularProgressBar());
                  }
                  return HomeCarosalslider(sliders: homeSlider.sliderHomeList,);
                }
              ),
              _buildSectionHeader(title: "Categories",onTapSeeAll: (){
                // Navigator.pushNamed(context, ProductCategory.name);
                Get.find<MainBottomNavController>().moveToIndex();
              }),
              _getListCategorySection(),

              _buildSectionHeader(title: "Popular",onTapSeeAll: (){}),
              _getPopularProducts(),
          
              _buildSectionHeader(title: "Special",onTapSeeAll: (){}),
              _getSpecialProducts(),

              _buildSectionHeader(title: "New",onTapSeeAll: (){}),
              _getNewProducts(),


          
            ],
          ),
        ),
      ),

    );
  }


  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navAppLogoSvg, width: 135.w,),
      actions: [
        AppbarIcon(iconData: Icons.person,onTap: (){},),
        AppbarIcon(iconData: Icons.call,onTap: (){},),
        AppbarIcon(iconData: Icons.notifications_none,onTap: (){},),
      ],
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required VoidCallback onTapSeeAll}) {
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
      height: 100.h,
      child: GetBuilder<CategoryListController>(
        builder: (controller) {
          if(controller.initialInProgress){
            return CenterCircularProgressBar();
          }
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.homeCategoryListItemLength,
              itemBuilder: (context,index){
                return ProductCategoryItem(categoryModel: controller.categoryList[index],);


          }, separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 10.w);
          },);
        }
      ),
    );
  }

  Widget _getPopularProducts(){
    return GetBuilder<PopularProductListController>(
      builder: (controller) {
        return Visibility(
          visible: controller.inProgress==false,
          replacement: CenterCircularProgressBar(),

          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 8,
              children: controller.productList.map((product)=>ProductCard(productModel: product,)).toList(),
            ),
          ),
        );
      }
    );

  }

  Widget _getSpecialProducts(){
    return GetBuilder<SpecialProductListController>(
      builder: (controller) {
        return Visibility(
          visible: controller.inProgress==false,
          child: SizedBox(
            height: 220.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return ProductCard(productModel: controller.productList[index],);

                },
                itemCount: controller.productList.length,
              separatorBuilder: (context, index){
                  return SizedBox(width: 10.w,);

            }, ),
          ),
        );
      }
    );
  }

  Widget _getNewProducts(){
    return GetBuilder<NewProductListController>(
      builder: (controller) {
        return Visibility(
          visible: controller.inProgress==false,
          replacement: CenterCircularProgressBar(),
          child: SizedBox(
            height: 220.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,

              itemBuilder: (context, index){
                return ProductCard(productModel: controller.productList[index],);

              },
              itemCount: controller.productList.length,
              separatorBuilder: (context, index){
                return SizedBox(width: 10.w,);

              }, ),
          ),
        );
      }
    );
  }


}






