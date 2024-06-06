import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mzizi_school_interview/presentation/account_screen.dart';
import 'package:mzizi_school_interview/presentation/bottom_nav_screen.dart';
import 'package:mzizi_school_interview/presentation/home_screen.dart';
import 'package:mzizi_school_interview/presentation/login_screen.dart';
import 'package:mzizi_school_interview/theme/app_style.dart';
import 'package:mzizi_school_interview/theme/color_constant.dart';
import 'package:mzizi_school_interview/theme/size_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController NameController = TextEditingController();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  bool _isHidden = true;
  bool isLoading = false;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth * 0.05;
    double textFieldWidth = screenWidth * 0.9;
    double textFieldHeight = 74.0;

    InputDecoration textFieldDecoration(String label) {
      return InputDecoration(
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
        label: Text(label),
        contentPadding: EdgeInsets.fromLTRB(14.0, 1.0, 4.0, 2.0),
        labelStyle: AppStyle.txtInterMedium18.copyWith(
          letterSpacing: 0.50,
          height: 1.00,
        ),
        filled: true,
        fillColor: ColorConstant.whiteA700,
      );
    }

    final nameField = TextFormField(
      controller: NameController,
      keyboardType: TextInputType.name,
      textAlignVertical: TextAlignVertical.center,
      autofocus: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'The name field is required.';
        }
        return null;
      },
      decoration: textFieldDecoration("Full Name"),
    );

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
      decoration: textFieldDecoration("Email address"),
    );

    final passwordField = TextFormField(
      controller: PasswordController,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value!.isEmpty) {
          return "Password is required.";
        } else if (value.length < 6) {
          return "Password must be at least 6 characters.";
        }
        return null;
      },
      obscureText: _isHidden,
      decoration: textFieldDecoration("Password").copyWith(
        errorText: _errorMessage,
        suffixIcon: IconButton(
          icon: Icon(
            _isHidden ? Icons.visibility : Icons.visibility_off,
            color: ColorConstant.lightGray,
          ),
          onPressed: _togglePasswordView,
        ),
      ),
    );

    return SafeArea(
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Create an account",
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
                    padding: EdgeInsets.only(top: 5),
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
                    padding: EdgeInsets.only(top: 45),
                    child: nameField,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: emailField,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: passwordField,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: MaterialButton(
                      color: ColorConstant.teal800,
                      shape: StadiumBorder(),
                      minWidth: textFieldWidth,
                      height: 50,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                              email: EmailController.text,
                              password: PasswordController.text)
                              .then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavScreen()),
                            ).onError((error, stackTrace) {
                              setState(() {
                                _errorMessage = error.toString();
                                isLoading = false;
                              });
                              print("Error ${error.toString()}");
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("User registered successfully")),
                            );
                          });
                        }
                      },
                      child: Text(
                        "Create Account",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: TextButton(
                      child: Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: ColorConstant.green,
                          fontSize: getFontSize(17),
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
