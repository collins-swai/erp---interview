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
          label: Text("Full Name"),
          contentPadding: EdgeInsets.fromLTRB(14.0, 1.0, 4.0, 2.0),
          labelStyle: AppStyle.txtInterMedium18.copyWith(
            letterSpacing: 0.50,
            height: 1.00,
          ),
          filled: true,
          fillColor: ColorConstant.whiteA700),
    );

    final emailField = TextFormField(
      controller: EmailController,
      keyboardType: TextInputType.name,
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
          fillColor: ColorConstant.whiteA700),
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
      obscureText: true,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorConstant.plainGrey),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorConstant.plainGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ColorConstant.teal800),
        ),
        contentPadding: EdgeInsets.fromLTRB(14.0, 1.0, 4.0, 2.0),
        labelStyle: AppStyle.txtInterMedium20.copyWith(
          letterSpacing: 0.50,
          height: 1.00,
        ),
        label: Text(
          "Password",
        ),
        filled: true,
        errorText: _errorMessage,
        alignLabelWithHint: true,
        fillColor: ColorConstant.whiteA700,
        suffix: Container(
          padding: getPadding(right: 5, top: 4),
          child: InkWell(
            onTap: _togglePasswordView,
            child: Icon(
              _isHidden ? Icons.visibility : Icons.visibility_off,
              color: ColorConstant.lightGray,
            ),
          ),
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
                            fontSize: getFontSize(
                              34,
                            ),
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
                            fontSize: getFontSize(
                              17,
                            ),
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
                  padding: getPadding(top: 45),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: getVerticalSize(74.00),
                      width: getHorizontalSize(396.00),
                      margin: getMargin(left: 16, right: 16, bottom: 4),
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: getVerticalSize(
                                74.00,
                              ),
                              width: getHorizontalSize(
                                396.00,
                              ),
                              margin: getMargin(
                                top: 10,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: nameField,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(top: 0.5),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: getVerticalSize(74.00),
                      width: getHorizontalSize(396.00),
                      margin: getMargin(left: 16, right: 16, bottom: 4),
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: getVerticalSize(
                                74.00,
                              ),
                              width: getHorizontalSize(
                                396.00,
                              ),
                              margin: getMargin(
                                top: 10,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: emailField,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(top: 0.5),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: getVerticalSize(74.00),
                      width: getHorizontalSize(396.00),
                      margin: getMargin(left: 16, right: 16, bottom: 4),
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: getVerticalSize(
                                74.00,
                              ),
                              width: getHorizontalSize(
                                396.00,
                              ),
                              margin: getMargin(
                                top: 10,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: passwordField,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: MaterialButton(
                    color: ColorConstant.teal800,
                    shape: StadiumBorder(),
                    minWidth: 370,
                    height: 50,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: EmailController.text,
                                  password: PasswordController.text)
                              .then((value) {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BottomNavScreen()))
                                .onError((error, stackTrace) {
                              print("Error ${error.toString()}");
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("User registered successfully")));
                          });
                          isLoading = true;
                        });
                      }
                      print("printed");
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
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                  ),
                )
              ],
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
