import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduated_project_all_car_needs/authentication/presentation/components/forgot_password_componants/confirm_button.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_color_constant.dart';

import '../../../core/constant/app_size_constat.dart';
import '../components/forgot_password_componants/change_password_form.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.grey[400],
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text("Create a new Password",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 25)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ChangePasswordForm(formKey: formKey, passwordController: passwordController, confirmPasswordController: confirmPasswordController),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            ConfirmButton(formKey: formKey,onPressed: (){}),
          ],
        ),
      ),
    );
  }
}