import 'package:e_commerce_app_ostad/app/app_colors.dart';
import 'package:e_commerce_app_ostad/core/ui/widgets/center_circular_progressbar.dart';
import 'package:e_commerce_app_ostad/core/ui/widgets/snackbar_message.dart';
import 'package:e_commerce_app_ostad/features/auth/data/models/signup_request_model.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/comtroller/signup_controller.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/screens/login_screen.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static final String name = "/signup";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _firstNController = TextEditingController();
  TextEditingController _lastNController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final SignupController _signupController =Get.find<SignupController>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(24.r),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(

                children: [
                  SizedBox(height: 25.h),
                  AppLogo(height: 90.h, width: 90.w),
                  SizedBox(height: 12.h,),
                  Text("Register Account", style: textTheme.titleLarge),
                  SizedBox(height: 6.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Text(
                        "Please enter your details to sign up",
                        style: textTheme.headlineMedium,
                      ),

                      Icon(
                        Icons.edit_calendar_outlined,
                        size: 18.r,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                Column(
                  spacing: 12,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: "Email"),
                      validator: (String? value) {
                        String emailValue = value ?? "";
                        if (EmailValidator.validate(emailValue) == false) {
                          return "Enter a valid Email";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _firstNController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: "First Name"),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Enter your First Name";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _lastNController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: "Last Name"),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Enter your Last Name";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _mobileController,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: "Mobile"),

                      validator: (String? value) {
                        String phone = value?.trim() ?? "";
                        RegExp regExp = RegExp(r'^(?:\+?88|0088)?01[15-9]\d{8}$');
                        if (regExp.hasMatch(phone) == false) {
                          return "Enter your valid phone number";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: "Password"),
                      validator: (String? value) {
                        if ((value?.length ?? 0) <= 6) {
                          return "Enter a valid Password";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _cityController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: "City"),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Enter your City";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      maxLines: 3,
                      controller: _addressController,
                      keyboardType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 12,
                        ),
                        hintText: "Shipping Address",
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Enter your Shipping Address";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                  SizedBox(height: 6.h,),
                  GetBuilder<SignupController>(
                    builder: (_) {
                      return Visibility(
                        visible: _signupController.inProgress ==false,
                        replacement:CenterCircularProgressBar() ,
                        child: ElevatedButton(
                          onPressed: _onTapSignUp,
                          child: Text("Sign Up"),
                          style: ButtonStyle(
                            fixedSize: WidgetStatePropertyAll(
                              Size.fromWidth(double.maxFinite),
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              AppColors.themeColor,
                            ),
                            foregroundColor: WidgetStatePropertyAll(Colors.white),
                            textStyle: WidgetStatePropertyAll(
                              TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                letterSpacing: .4,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                  
                  RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account?"
                          ),
                          TextSpan(
                              text: "Sign In",
                            recognizer: TapGestureRecognizer()..onTap = _moveToLogin,
                            style: TextStyle(color: AppColors.themeColor)
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

  void _moveToLogin(){
    Get.to(LoginScreen.name);
  }

  Future<void> _onTapSignUp() async {
    if (_formKey.currentState!.validate()) {

      final SignupRequestModel model = SignupRequestModel(
          email: _emailController.text.trim(),
          firstName: _firstNController.text.trim(),
          lastName: _lastNController.text.trim(),
          city: _cityController.text.trim(),
          password: _passwordController.text,
          mobile: _mobileController.text.trim(),
          address: _addressController.text.trim());
      

      final bool isSuccess =await _signupController.signUp(model);

      if(isSuccess){
        showSnackBarMessage(context, _signupController.message);  //  after successful signup it will move to otp screen with email
        Navigator.pushNamed(context, VerifyOtpScreen.name,arguments: _emailController.text.trim());


      }else{
        showSnackBarMessage(context, _signupController.errorMessage!,true);
      }
    }

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _firstNController.dispose();
    _lastNController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();


  }
}
