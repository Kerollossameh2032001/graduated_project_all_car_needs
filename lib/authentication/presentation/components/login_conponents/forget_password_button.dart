import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      ///Todo: Forget Password Screen
      onPressed: () {},
      child: Text(
        'Forget Password?',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}