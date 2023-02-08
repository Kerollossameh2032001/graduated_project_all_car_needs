import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80.0),
              child: Text(
                'HOW CAN I HELP YOU?',
                style: TextStyle(
                    color: HexColor('#585858'),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: 'cairo-light'),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(
            children: [
              Padding(
                padding:
                EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        ///ToDo navigate to winsh screen
                      },
                      splashColor: HexColor('#585858'),
                      focusColor: HexColor('#585858'),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.height * 0.18,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Image.asset('assets/images/winsh.jpg'),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        ///ToDo navigate to winsh screen
                      },
                      child: Text(
                        'Winsh',
                        style: TextStyle(
                          fontFamily: 'cairo-light',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: HexColor('#585858'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        ///ToDo navigate to oil car screen
                      },
                      splashColor: HexColor('#585858'),
                      focusColor: HexColor('#585858'),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.height * 0.18,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Image.asset('assets/images/oil car icon.jpg'),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        ///ToDo navigate to oil car screen
                      },
                      child: Text(
                        'Oil & Gasoline',
                        style: TextStyle(
                          fontFamily: 'cairo-light',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: HexColor('#585858'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding:
                EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        ///ToDo navigate to car repair screen
                      },
                      splashColor: HexColor('#585858'),
                      focusColor: HexColor('#585858'),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.height * 0.18,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset('assets/images/workshop man.jpg'),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        ///ToDo navigate to car repair screen
                      },
                      child: Text(
                        'Car repair',
                        style: TextStyle(
                          fontFamily: 'cairo-light',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: HexColor('#585858'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        ///ToDo navigate to shop screen
                      },
                      splashColor: HexColor('#585858'),
                      focusColor: HexColor('#585858'),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.height * 0.18,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Image.asset('assets/images/winsh.jpg'),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        ///ToDo navigate to shop screen
                      },
                      child: Text(
                        'Shop',
                        style: TextStyle(
                          fontFamily: 'cairo-light',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: HexColor('#585858'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: GNav(
          onTabChange: (index){

          },
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
    );
  }
}
