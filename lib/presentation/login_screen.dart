import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mzizi_school_interview/presentation/account_screen.dart';
import 'package:mzizi_school_interview/presentation/bottom_nav_screen.dart';
import 'package:mzizi_school_interview/presentation/signup_screen.dart';
import 'package:mzizi_school_interview/theme/app_style.dart';
import 'package:mzizi_school_interview/theme/color_constant.dart';
import 'package:mzizi_school_interview/theme/size_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  bool _isHidden = true;
  bool isLoading = false;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double textFieldWidth = screenWidth * 0.9;
    final double textFieldHeight = screenHeight * 0.1;

    final emailField = TextFormField(
      controller: EmailController,
      keyboardType: TextInputType.emailAddress,
      textAlignVertical: TextAlignVertical.center,
      autofocus: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'The email field is required.';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorConstant.plainGrey),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorConstant.teal800),
        ),
        label: Text("Email address"),
        contentPadding: EdgeInsets.fromLTRB(14.0, 1.0, 4.0, 2.0),
        labelStyle: AppStyle.txtInterMedium18.copyWith(
          letterSpacing: 0.50,
          height: 1.00,
        ),
        filled: true,
        fillColor: ColorConstant.whiteA700,
      ),
    );

    final passwordField = TextFormField(
      controller: PasswordController,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value!.isEmpty) {
          return "Password";
        } else if (value.length < 6) {
          return "Password";
        }
        return null;
      },
      obscureText: _isHidden,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorConstant.plainGrey),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorConstant.teal800),
        ),
        label: Text("Password"),
        contentPadding: EdgeInsets.fromLTRB(14.0, 1.0, 4.0, 2.0),
        labelStyle: AppStyle.txtInterMedium18.copyWith(
          letterSpacing: 0.50,
          height: 1.00,
        ),
        filled: true,
        fillColor: ColorConstant.whiteA700,
        suffixIcon: InkWell(
          onTap: _togglePasswordView,
          child: Icon(
            _isHidden ? Icons.visibility : Icons.visibility_off,
            color: ColorConstant.lightGray,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: ColorConstant.black,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AccountScreen()));
          },
        ),
        backgroundColor: ColorConstant.whiteA700,
        shadowColor: ColorConstant.whiteA700,
        elevation: 0.0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),  // Add padding here
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.02),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Login to your account",
                                style: TextStyle(
                                  color: ColorConstant.black,
                                  fontSize: getFontSize(34),
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.01),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Invest and double your income now",
                                style: TextStyle(
                                  color: ColorConstant.black,
                                  fontSize: getFontSize(17),
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.05),
                        child: Container(
                          width: textFieldWidth,
                          child: emailField,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.02),
                        child: Container(
                          width: textFieldWidth,
                          child: passwordField,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.03),
                        child: MaterialButton(
                          color: ColorConstant.teal800,
                          shape: StadiumBorder(),
                          minWidth: textFieldWidth,
                          height: textFieldHeight * 0.5,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                    email: EmailController.text,
                                    password: PasswordController.text)
                                    .then((value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BottomNavScreen()));
                                }).onError((error, stackTrace) {
                                  print("Error ${error.toString()}");
                                });
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("User logged in successfully")));
                            }
                          },
                          child: Text(
                            "Login Account",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.02),
                        child: TextButton(
                          child: Text(
                            "Don't have an account?",
                            style: TextStyle(
                                color: ColorConstant.green,
                                fontSize: getFontSize(17),
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w400),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
