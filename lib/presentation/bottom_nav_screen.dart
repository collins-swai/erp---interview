import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mzizi_school_interview/presentation/home_screen.dart';
import 'package:mzizi_school_interview/presentation/notification_screen.dart';
import 'package:mzizi_school_interview/presentation/product_screen.dart';
import 'package:mzizi_school_interview/presentation/profile_screen.dart';
import 'package:mzizi_school_interview/theme/color_constant.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      HomeScreen(),
      ProductScreen(),
      NotificationScreen(),
      ProfileScreen(),
    ];

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.gray900,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: ColorConstant.backgroundGreen,
          unselectedItemColor: ColorConstant.gray900,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: ColorConstant.gray600,
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Product',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.currency_exchange),
              label: 'Transactions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_sharp),
              label: 'Account',
            ),
          ],
        ),
        body: _widgetOptions?.elementAt(_selectedIndex),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    _onBackPressed();
    return true;
  }

  Object _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: const Text('Do you want to exit the App'),
          actions: <Widget>[
            MaterialButton(
              child: const Text(
                'No',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop(false); //Will not exit the App
              },
            ),
            MaterialButton(
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                exit(0);
              },
            )
          ],
        );
      },
    );
  }

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}
