import 'package:e_commerce_app_ostad/core/ui/widgets/center_circular_progressbar.dart';
import 'package:e_commerce_app_ostad/features/common/controllers/category_list_controller.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<CategoryListController>().getCategoryList();
    _scrollController.addListener(_loadMoreData);  // scroll k listen korbe

  }

  final ScrollController _scrollController = ScrollController();
  final CategoryListController _categoryListController = Get.find<CategoryListController>();



  void _loadMoreData(){
    if(_scrollController.position.extentAfter<300){
      _categoryListController.getCategoryList();

    }

  }


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
          leadingWidth: 30,
        leading: Padding(
          padding:  EdgeInsets.only(left:8.w),

          child: IconButton(
            onPressed: (){
              Get.find<MainBottomNavController>().backToHome();

            },
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.black87, size: 20.r,)),
        ),


        ),
        body: GetBuilder<CategoryListController>(
          builder: (controller) {
            if(controller.initialInProgress){
              return CenterCircularProgressBar();
            }
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.all(16.r),
                    child: GridView.builder(
                      controller: _scrollController,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 2
                        )
                        , itemCount: controller.categoryList.length,
                        itemBuilder: (context, index){
                          return FittedBox(child: ProductCategoryItem(categoryModel: controller.categoryList[index],)); // fitted box used so that no widgets will breaks
                        }),
                  ),
                ),
                Visibility(
                    visible: controller.inProgress,
                    child: LinearProgressIndicator())
              ],
            );
          }
        ),
      ),
    );
  }

}
