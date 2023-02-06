import 'package:flutter/material.dart';
import 'package:graduated_project_all_car_needs/authentication/presentation/controller/login_cubit/login_cubit.dart';

import '../../../../core/constant/app_color_constant.dart';
import '../../../../core/constant/app_size_constat.dart';
import 'forget_password_button.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final LoginCubit cubit;

  const LoginForm(
      {Key? key,
      required this.formKey,
      required this.phoneController,
      required this.passwordController,
      required this.cubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
            color: AppColorConstant.containerColor,
            border: Border.all(
              color: AppColorConstant.borderColor,
              width: AppSizeConstant.borderContainerWidth,
            ),
            borderRadius: BorderRadius.circular(AppSizeConstant.borderRadius)),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Phone',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextFormField(
                  cursorColor: AppColorConstant.signInColor,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColorConstant.signInColor),
                      borderRadius:
                          BorderRadius.circular(AppSizeConstant.borderRadius),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppSizeConstant.borderRadius),
                        borderSide:
                            BorderSide(color: AppColorConstant.signInColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppSizeConstant.borderRadius),
                        borderSide:
                            BorderSide(color: AppColorConstant.signInColor)),
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (String? value) {
                    if (value!.length < 11) {
                      return 'Phone number is too small';
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  'Password',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextFormField(
                  cursorColor: AppColorConstant.signInColor,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                        onPressed: () {
                          cubit.changeVisibility();
                        },
                        icon: Icon(
                          cubit.visibility,
                          color: Colors.grey,
                        )),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColorConstant.signInColor),
                      borderRadius:
                          BorderRadius.circular(AppSizeConstant.borderRadius),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppSizeConstant.borderRadius),
                        borderSide:
                            BorderSide(color: AppColorConstant.signInColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppSizeConstant.borderRadius),
                        borderSide:
                            BorderSide(color: AppColorConstant.signInColor)),
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                  obscureText: cubit.obscureText,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Password can\'t be empty';
                    }
                    return null;
                  },
                ),
                const ForgetPasswordButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
