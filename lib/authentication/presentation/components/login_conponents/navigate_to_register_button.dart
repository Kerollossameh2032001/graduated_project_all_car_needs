import 'package:flutter/material.dart';
import 'package:graduated_project_all_car_needs/authentication/presentation/screens/register_screen.dart';

class NavigateToRegisterScreen extends StatelessWidget {
  const NavigateToRegisterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              transitionsBuilder: (context, animation, animationTime, child) {
                animation =
                    CurvedAnimation(parent: animation, curve: Curves.easeIn);
                return ScaleTransition(
                  scale: animation,
                  alignment: Alignment.center,
                  child: child,
                );
              },
              pageBuilder: (context, animation, animationTime) {
                return  RegisterScreen();
              }),
        );
      },
      child: Text(
        'Create a new account?',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}