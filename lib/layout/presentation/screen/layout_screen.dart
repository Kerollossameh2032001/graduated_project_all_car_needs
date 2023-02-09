import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:graduated_project_all_car_needs/layout/presentation/screen/home_screen.dart';
import 'package:graduated_project_all_car_needs/layout/presentation/screen/notifecation_screen.dart';
import 'package:graduated_project_all_car_needs/layout/presentation/screen/setting_screen.dart';

class LayoutScreen extends StatefulWidget {
  final String token;

  const LayoutScreen({Key? key, required this.token}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedScreen = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const NotificationScreen(),
    const SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedScreen],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: GNav(
              onTabChange: (index) {
                setState(() {
                  selectedScreen = index;
                });
              },
              //tabBackgroundColor: Colors.grey.shade800,
              gap: 8,
              iconSize: 25,
              backgroundColor: Colors.black,
              // rippleColor: Colors.grey[800]!, // tab button ripple color when pressed
              // hoverColor: Colors.grey[700]!, // tab button hover color
              // haptic: true, // haptic feedback
              // tabBorderRadius: 15,
              // tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
              // tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
              // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
              // curve: Curves.easeIn, // tab animation curves
              // duration: const Duration(milliseconds: 800), // tab animation duration
              // gap: 8, // the tab button gap between icon and text
              color: Colors.grey,
              // unselected icon color
              activeColor: Colors.white,
              // selected icon and text color
              // iconSize: 24, // tab button icon size
              // tabBackgroundColor: Colors.purple.withOpacity(0.1), // selected tab background color
              //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // navigation bar padding
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.notifications,
                  text: 'Notification',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'User',
                ),
              ]),
        ),
      ),
    );
  }
}
