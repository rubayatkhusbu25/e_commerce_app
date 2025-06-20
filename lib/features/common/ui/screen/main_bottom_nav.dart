import 'package:e_commerce_app_ostad/features/common/controllers/main_bottom_nav_controller.dart';
import 'package:e_commerce_app_ostad/features/home/ui/screen/home_screen.dart';
import 'package:e_commerce_app_ostad/features/products/ui/screen/product_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNav extends StatefulWidget {
  const MainBottomNav({super.key});

  static final String name= "/main-bottom-nav";

  @override
  State<MainBottomNav> createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {

  final List<Widget> _screens=[
    HomeScreen(),
    ProductCategory(),
    ProductCategory(),
    ProductCategory(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (navController) {
        return Scaffold(
          body: _screens[navController.selectedIndex],

          bottomNavigationBar: NavigationBar(
            selectedIndex: navController.selectedIndex,
            onDestinationSelected: navController.changeIndex,
              destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.category_outlined), label: "Category"),
            NavigationDestination(icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
            NavigationDestination(icon: Icon(Icons.favorite_border_outlined), label: "Wishlist"),
          ]),

        );
      }
    );
  }
}
