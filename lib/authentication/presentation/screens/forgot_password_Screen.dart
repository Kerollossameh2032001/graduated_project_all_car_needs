import 'package:flutter/material.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_color_constant.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_size_constat.dart';
import 'package:hexcolor/hexcolor.dart';

import '../components/forgot_password_componants/confirm_button.dart';
import '../../../core/global/widgets/navigate_to.dart';
import 'input_code_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot password',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: HexColor('#585858'),
                      ),
                ),
                Text(
                  'Enter your phone number, we will send you 6 digits verification code',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Text('Phone', style: Theme.of(context).textTheme.bodyMedium),
                TextFormField(
                  cursorColor: AppColorConstant.signInColor,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (String? value) {
                    if (value!.length < 11) {
                      return 'Invalid phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                ConfirmButton(
                    formKey: formKey,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        navigateTo(context, InputCodeScreen());
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
