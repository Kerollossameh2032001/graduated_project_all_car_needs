import 'package:flutter/material.dart';
import 'package:graduated_project_all_car_needs/authentication/presentation/components/forgot_password_componants/confirm_button.dart';
import 'package:graduated_project_all_car_needs/core/global/widgets/navigate_to.dart';
import 'package:graduated_project_all_car_needs/authentication/presentation/screens/create_new_password_screen.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_color_constant.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_color_constant.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_color_constant.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_color_constant.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_size_constat.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_size_constat.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_size_constat.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_size_constat.dart';
import 'package:hexcolor/hexcolor.dart';

class InputCodeScreen extends StatelessWidget {
  InputCodeScreen({Key? key}) : super(key: key);

  final TextEditingController codeController = TextEditingController();
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
                  'Verification code',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: HexColor('#585858'),
                  ),
                ),
                Text(
                  'Enter the code we sent',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Text('Code', style: Theme.of(context).textTheme.bodyMedium),
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
                  controller: codeController,
                  keyboardType: TextInputType.phone,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Code invalid';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                ConfirmButton(
                  formKey: formKey,
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      navigateTo(context, CreateNewPasswordScreen());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
