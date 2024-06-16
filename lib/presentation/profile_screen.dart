import 'package:flutter/material.dart';
import 'package:mzizi_school_interview/theme/color_constant.dart';
import 'package:mzizi_school_interview/theme/size_utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: ColorConstant.black900,
        ),
        backgroundColor: ColorConstant.whiteA700,
        shadowColor: ColorConstant.whiteA700,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 15),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Profile",
                      style: TextStyle(
                        color: ColorConstant.black,
                        fontSize: getFontSize(34),
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15, left: 30, right: 30),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/profiles.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
