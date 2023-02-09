import 'package:flutter/material.dart';

import '../../../../core/constant/app_size_constat.dart';
import '../../screens/input_code_screen.dart';
import '../../../../core/global/widgets/navigate_to.dart';

class ConfirmButton extends StatelessWidget {
  final void Function()?onPressed;
  const ConfirmButton({
    super.key,
    required this.formKey,
     this.onPressed,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(
            AppSizeConstant.borderRadius,
          ),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text('Confirm',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),),
        ),
      ),
    );
  }
}
