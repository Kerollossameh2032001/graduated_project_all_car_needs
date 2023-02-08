import 'package:flutter/material.dart';

import '../../../../core/constant/app_color_constant.dart';
import '../../../../core/constant/app_size_constat.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({
    super.key,
    required this.formKey,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter a new password",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 3),
                TextFormField(
                  cursorColor: AppColorConstant.signInColor,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        )),
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                  obscureText: true,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Password can\'t be empty';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Confirm a password",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 3),
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
                        onPressed: () {},
                        icon: const Icon(
                          Icons.visibility,
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
                  obscureText: true,
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Password can\'t be empty';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}