import 'package:e_commerce_app_ostad/app/app_colors.dart';
import 'package:e_commerce_app_ostad/features/products/ui/screen/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCategoryItem extends StatefulWidget {
  const ProductCategoryItem({super.key});

  @override
  State<ProductCategoryItem> createState() => _ProductCategoryItemState();
}

class _ProductCategoryItemState extends State<ProductCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        /// TODO: Navigate to product list screen
        Navigator.pushNamed(context, ProductListScreen.name, arguments: "Computer");
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(.2),
              borderRadius: BorderRadius.circular(8),

            ),
            child: Icon(Icons.computer,color: AppColors.themeColor,size: 32.r,),
          ),
          Text("Computer",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.themeColor))
        ],

      ),
    );
  }
}
