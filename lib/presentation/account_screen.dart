import 'package:flutter/material.dart';
import 'package:mzizi_school_interview/presentation/home_screen.dart';
import 'package:mzizi_school_interview/presentation/login_screen.dart';
import 'package:mzizi_school_interview/presentation/signup_screen.dart';
import 'package:mzizi_school_interview/theme/color_constant.dart';
import 'package:mzizi_school_interview/theme/size_utils.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.07),
                    child: Container(
                      height: screenHeight * 0.35,
                      width: double.infinity,
                      child: Image.asset("assets/images/currency.png",
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.03),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Stay on top of your\n",
                        style: TextStyle(
                          color: ColorConstant.black,
                          fontSize: getFontSize(
                            34,
                          ),
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: "   finance with us.",
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
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.03,
                    left: screenWidth * 0.1,
                    right: screenWidth * 0.1),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "   We are your new financial Advisors \n",
                        style: TextStyle(
                          color: ColorConstant.blackGrey,
                          fontSize: getFontSize(
                            17,
                          ),
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "to recommend the best investments for \n",
                        style: TextStyle(
                          color: ColorConstant.blackGrey,
                          fontSize: getFontSize(
                            17,
                          ),
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: " you",
                        style: TextStyle(
                          color: ColorConstant.blackGrey,
                          fontSize: getFontSize(
                            17,
                          ),
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.1),
                child: MaterialButton(
                  color: ColorConstant.teal800,
                  shape: const StadiumBorder(),
                  minWidth: screenWidth * 0.7,
                  height: screenHeight * 0.07,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  child: const Text(
                    "Create Account",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.01),
                child: TextButton(
                  child: Text("Login",
                      style: TextStyle(
                          color: ColorConstant.green,
                          fontSize: getFontSize(17),
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w400)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
