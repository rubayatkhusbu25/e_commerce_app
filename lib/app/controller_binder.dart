import 'package:e_commerce_app_ostad/core/service/network/network_client.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/comtroller/login_controller.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/comtroller/signup_controller.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/comtroller/verify_otp_controller.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/screens/login_screen.dart';
import 'package:e_commerce_app_ostad/features/cart/ui/controller/cart_list_controller.dart';
import 'package:e_commerce_app_ostad/features/common/controllers/auth_controller.dart';
import 'package:e_commerce_app_ostad/features/common/controllers/category_list_controller.dart';
import 'package:e_commerce_app_ostad/features/common/controllers/main_bottom_nav_controller.dart';
import 'package:e_commerce_app_ostad/features/home/ui/controller/home_slider_controller.dart';
import 'package:e_commerce_app_ostad/features/home/ui/controller/new_product_list_controller.dart';
import 'package:e_commerce_app_ostad/features/home/ui/controller/popular_product_list_controller.dart';
import 'package:e_commerce_app_ostad/features/home/ui/controller/spcial_product_list_controller.dart';
import 'package:e_commerce_app_ostad/features/products/controller/add_to_cart_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{

  final AuthController _authController = AuthController();

  @override
  void dependencies() {
    Get.put(_authController);
    Get.put( MainBottomNavController());
    Get.put( NetworkClient(
        onUnAuthorize: _unauthorized,
        commonHeaders: (){
      return _commonHeaders();
    }));
    Get.put(SignupController());
    Get.put(VerifyOtpController());
    Get.put(LoginController());
    Get.put(HomeSliderController());
    Get.put(CategoryListController());
    Get.put(PopularProductListController());
    Get.put(NewProductListController());
    Get.put(SpecialProductListController());
    Get.put(AddToCartController());
    Get.put(CartListController());


  }


  Future<void> _unauthorized() async {

    await _authController.clearUserData();    // unAuthorized hole 401 hole user data clear kore dibo mwmory theke o abr login korabo
    Get.to(()=> LoginScreen());
  }


   Map<String, String>_commonHeaders(){
     return {
       "content-type": "application/json",
       "token":  _authController.accessToken?? ""
     };
   }

}