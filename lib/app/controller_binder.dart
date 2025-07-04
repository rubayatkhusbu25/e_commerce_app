import 'package:e_commerce_app_ostad/core/service/network/network_client.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/comtroller/signup_controller.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/comtroller/verify_otp_controller.dart';
import 'package:e_commerce_app_ostad/features/common/controllers/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put( MainBottomNavController());
    Get.put( NetworkClient(onUnAuthorize: _unauthorized, commonHeaders: _commonHeaders));
    Get.put(SignupController());
    Get.put(VerifyOtpController());
  }


  void _unauthorized(){
    ///TODO: logOut and re-login
  }

  final Map<String, String>_commonHeaders={
    "content-type": "application/json",
    "token": ""
  };

}