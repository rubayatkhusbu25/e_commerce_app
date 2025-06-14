import 'package:e_commerce_app_ostad/app/app_colors.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/screens/sign_up_screen.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme =Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(

            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                spacing: 12,
                children: [
                  SizedBox(height: 44,),
                  AppLogo(
                    height: 90,
                    width: 90,
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
                  ElevatedButton(
                      onPressed: _onTapLogin,
                      child: Text("Login"),
                  style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(Size.fromWidth(double.maxFinite)),
                    backgroundColor: WidgetStatePropertyAll(AppColors.themeColor),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    textStyle: WidgetStatePropertyAll(TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: .4,
                    ))
                  ),)
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapLogin(){

    Navigator.pushNamed(context, SignUpScreen.name);
    // if(_formKey.currentState!.validate()){
    //
    // };
  }
}
