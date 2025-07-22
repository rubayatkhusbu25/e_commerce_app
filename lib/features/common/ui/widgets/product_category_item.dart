import 'package:e_commerce_app_ostad/app/app_colors.dart';
import 'package:e_commerce_app_ostad/features/common/model/category_model.dart';
import 'package:e_commerce_app_ostad/features/products/ui/screen/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListScreen.name, arguments: categoryModel);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(.2),
              borderRadius: BorderRadius.circular(8),

            ),
            child: Image.network(categoryModel.iconUrl,height: 32.w,width: 32.w,),
          ),
          Text(_getTitle(categoryModel.title),style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.themeColor))
        ],

      ),
    );
  }


  // jodi nam boro kore show kore fixed length porjonto nam show korar jnno

  String _getTitle(String title){
    if(title.length>9){
      return '${title.substring(0,8)}..';  // length 9 tai 8 jodi 8 hoto to 7 hoto, 7 hole 6..
    }
    return title;
  }
}
