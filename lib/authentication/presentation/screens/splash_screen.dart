import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graduated_project_all_car_needs/authentication/presentation/screens/register_screen.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_color_constant.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_string_constants.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool visible = false;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      visible = true;
      setState(() {});
      timer.cancel();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/1.jpg'),
                  fit: BoxFit.fitHeight),
            ),
          ),
          AnimatedPositioned(
            top: visible ? 50 : 100,
            left: 50,
            duration: const Duration(milliseconds: 500),
            child: Image.asset(
              'assets/images/logo icon.png',
              height: 400,
              width: 300,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            top: visible ? 390 : 450,
            left: 50,
            child: const Text(
              AppStringConstant.appName,
              style:  TextStyle(
                fontSize: 70,
                fontFamily: 'khaled_font',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AnimatedPositioned(
            top: visible
                ? MediaQuery.of(context).size.height * 0.65
                : MediaQuery.of(context).size.height * 1,
            duration: const Duration(milliseconds: 500),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: AppColorConstant.startColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50))),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.09,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              transitionsBuilder:
                                  (context, animation, animationTime, child) {
                                animation = CurvedAnimation(
                                    parent: animation, curve: Curves.easeIn);
                                return ScaleTransition(
                                  scale: animation,
                                  alignment: Alignment.center,
                                  child: child,
                                );
                              },
                              pageBuilder: (context, animation, animationTime) {
                                return LoginScreen();
                              }),
                        );
                      },
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'cairo-light',
                            fontSize: 25),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.09,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            transitionsBuilder:
                                (context, animation, animationTime, child) {
                              animation = CurvedAnimation(
                                  parent: animation, curve: Curves.easeIn);
                              return ScaleTransition(
                                scale: animation,
                                alignment: Alignment.center,
                                child: child,
                              );
                            },
                            pageBuilder: (context, animation, animationTime) {
                              return RegisterScreen();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        'REGISTER',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'cairo-light',
                            fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
