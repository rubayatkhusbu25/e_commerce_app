import 'package:e_commerce_app_ostad/features/common/controllers/main_bottom_nav_controller.dart';
import 'package:e_commerce_app_ostad/features/common/ui/widgets/product_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({super.key});


  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, //phn ar back button a click korleo jeno na ber hy
      onPopInvokedWithResult: (_,__){
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
        leading: Padding(
          padding:  EdgeInsets.only(left:16.w),
          child: IconButton(
            onPressed: (){
              Get.find<MainBottomNavController>().backToHome();

            },
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.black87, size: 20.r,)),
        ),
          leadingWidth: 40,

        ),
        body: Padding(
          padding:  EdgeInsets.all(16.r),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 2
              )
              , itemCount: 48,
              itemBuilder: (context, index){
                return FittedBox(child: ProductCategoryItem()); // fitted box used so that no widgets will breaks
              }),
        ),
      ),
    );
  }

}
