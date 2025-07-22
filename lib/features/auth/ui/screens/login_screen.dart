import 'package:e_commerce_app_ostad/app/app_colors.dart';
import 'package:e_commerce_app_ostad/core/ui/widgets/center_circular_progressbar.dart';
import 'package:e_commerce_app_ostad/core/ui/widgets/snackbar_message.dart';
import 'package:e_commerce_app_ostad/features/auth/data/models/login_request_model.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/comtroller/login_controller.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/screens/sign_up_screen.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/widgets/app_logo.dart';
import 'package:e_commerce_app_ostad/features/common/ui/screen/main_bottom_nav.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static final String name = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginController _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme =Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(24.r),
          child: SingleChildScrollView(

            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                spacing: 12,
                children: [
                  SizedBox(height: 44.h,),
                  AppLogo(
                    height: 90.h,
                    width: 90.w,
                  ),
                  Text("Welcome Back",style: textTheme.titleLarge),
                  Text("Please enter your Email & Password",style: textTheme.headlineMedium,),
                  TextFormField(
                    controller: _emailController,
                     keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "Email"
                    ),
                  validator: (String? value){
                       String emailValue = value ?? "";
                       if(EmailValidator.validate(emailValue)==false){
                         return "Enter a valid Email";
                       }
                       return null;
              
                  },),
                  TextFormField(
                    controller: _passwordController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: "Password"
              
                      ),
                      validator: (String? value){

                        if((value?.length??0 )<=6){
                          return "Enter a valid Password";
                        }
                        return null;

                      }),
                  GetBuilder(
                    init: _loginController,
                    builder: (context) {
                      return Visibility(
                        visible:_loginController.inProgress== false ,
                        replacement: CenterCircularProgressBar(),
                        child: ElevatedButton(
                            onPressed: _onTapLogin,
                            child: Text("Login"),
                        style: ButtonStyle(
                          fixedSize: WidgetStatePropertyAll(Size.fromWidth(double.maxFinite)),
                          backgroundColor: WidgetStatePropertyAll(AppColors.themeColor),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                          textStyle: WidgetStatePropertyAll(TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            letterSpacing: .4,
                          ))
                        ),),
                      );
                    }
                  ),
                  RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyle(color: Colors.grey,fontSize:14.sp )
                            ),
                            TextSpan(
                                text: "Sign Up",
                                recognizer: TapGestureRecognizer()..onTap=_moveToSignUp,
                                style: TextStyle(color: AppColors.themeColor,fontSize:14.sp ,fontWeight: FontWeight.bold)
                            ),

                          ]
                      ))
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _moveToSignUp(){
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  Future<void> _onTapLogin() async {

    if(_formKey.currentState!.validate()){
      
      LoginRequestModel model = LoginRequestModel(
          email: _emailController.text.trim(),
          password: _passwordController.text);

      final bool isSuccess = await _loginController.login(model);
      if(isSuccess){
       Navigator.pushNamedAndRemoveUntil(context, MainBottomNav.name, (predicate)=>false);

      }else{

        showSnackBarMessage(context, _loginController.errorMessage!, true);



      }




    };
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}

