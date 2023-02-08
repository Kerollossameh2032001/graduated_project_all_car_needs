import 'package:flutter/material.dart';
import 'package:graduated_project_all_car_needs/authentication/presentation/screens/forgot_password_Screen.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      ///Todo: Forget Password Screen
      onPressed: () {
        Navigator.push(context, PageRouteBuilder(
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
              return   ForgotPasswordScreen();
            }),
        );
      },
      child: Text(
        'Forget Password?',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}