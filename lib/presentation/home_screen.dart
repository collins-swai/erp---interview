import 'package:flutter/material.dart';
import 'package:mzizi_school_interview/theme/color_constant.dart';
import 'package:mzizi_school_interview/theme/size_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: ColorConstant.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
                child: Icon(Icons.notifications, color: ColorConstant.black)),
          )
        ],
        backgroundColor: ColorConstant.whiteA700,
        shadowColor: ColorConstant.whiteA700,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15, right: 90),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Welcome, Jessie.",
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
              padding: EdgeInsets.only(left: 15, top: 30),
              child: Container(
                width: 370,
                height: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: ColorConstant.green,
                  elevation: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 130),
                        child: Text(
                          'Your total asset portfolio.',
                          style: TextStyle(
                              fontSize: getFontSize(16),
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'N203,935',
                              style: TextStyle(
                                  fontSize: getFontSize(32),
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w600,
                                  color: ColorConstant.whiteA700),
                            ),
                            const SizedBox(width: 90),
                            MaterialButton(
                              color: ColorConstant.whiteA700,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Text(
                                'Invest Now',
                                style: TextStyle(
                                    fontSize: getFontSize(14),
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w400,
                                    color: ColorConstant.green),
                              ),
                              onPressed: () {
                                /* ... */
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, top: 15, right: 20),
              child: Row(children: [
                Text('Best Plans',
                    style: TextStyle(
                        fontSize: getFontSize(22),
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                        color: ColorConstant.black)),
                Spacer(),
                Text(
                  'See All →',
                  style: TextStyle(
                      fontSize: getFontSize(18),
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w200,
                      color: ColorConstant.red),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                        child: buildCard(
                            "assets/images/dollar.png",
                            "Gold",
                            "30% Return",
                            LinearGradient(
                              colors: [ColorConstant.gold, ColorConstant.Gold],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ))),
                    SizedBox(width: 5),
                    buildCard(
                        "assets/images/euro.png",
                        "Silver",
                        "60% Return",
                        LinearGradient(
                          colors: [ColorConstant.purple, ColorConstant.Purple],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    buildCard(
                        "assets/images/bitcoin.png",
                        "Platinum",
                        "90% Return",
                        LinearGradient(
                          colors: [ColorConstant.violet, ColorConstant.Violet],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, right: 210),
              child: Text(
                'Investment Guide',
                style: TextStyle(
                    fontSize: getFontSize(22),
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildListTile(
                      "Basic type of investments",
                      "This is how you set your foot for 2020 Stock market recession. What’s next...",
                      'assets/images/pnps.png'),
                  _buildListTile(
                      "How much can you start wit..",
                      "What do you like to see? It’s a very different market from 2018. The way...",
                      'assets/images/shapes.png'),
                  _buildListTile(
                      "Basic type of investments",
                      "This is how you set your foot for 2020 Stock market recession. What’s next...",
                      'assets/images/pnps.png'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCard(String imagePath, String title, String description,
      LinearGradient gradient) {
    return Container(
      width: 120,
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: gradient,
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: getFontSize(17),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SF Pro Text',
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: getFontSize(13),
                        fontFamily: 'SF Pro Text',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Opacity(
                  opacity: 0.58,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return gradient.createShader(bounds);
                    },
                    child: Image.asset(
                      imagePath,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(String title, String subtitle, String avatarImagePath) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Text(
        title,
        style: TextStyle(
          fontSize: getFontSize(18),
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w700,
          color: ColorConstant.blackGrey,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: getFontSize(14),
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w400,
          color: ColorConstant.blackGrey,
        ),
      ),
      trailing: CircleAvatar(
        backgroundImage: AssetImage(avatarImagePath),
        radius: 25,
      ),
    );
  }
}
