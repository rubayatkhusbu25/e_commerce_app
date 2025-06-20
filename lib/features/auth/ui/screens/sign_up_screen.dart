import 'package:e_commerce_app_ostad/app/app_colors.dart';
import 'package:e_commerce_app_ostad/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(

                children: [
                  SizedBox(height: 44),
                  AppLogo(height: 90, width: 90),
                  SizedBox(height: 12,),
                  Text("Register Account", style: textTheme.titleLarge),
                  SizedBox(height: 6,),
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
                        size: 18,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
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
                  SizedBox(height: 6,),
                  ElevatedButton(
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
                          fontSize: 16,
                          letterSpacing: .4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUp() {
    if (_formKey.currentState!.validate()) {}
    ;
  }
}
