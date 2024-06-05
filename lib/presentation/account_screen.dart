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
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    child: Image.asset("assets/images/currency.png"),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
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
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
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
                      text: "to recommed the best investments for \n",
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
                      text: "                              you",
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
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 65),
              child: MaterialButton(
                color: ColorConstant.teal800,
                shape: StadiumBorder(),
                minWidth: 270,
                height: 50,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
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
                child: Text("Login",
                    style: TextStyle(
                        color: ColorConstant.green,
                        fontSize: getFontSize(17),
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w400)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
