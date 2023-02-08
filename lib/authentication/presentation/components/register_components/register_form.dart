import 'package:flutter/material.dart';

import '../../../../core/constant/app_color_constant.dart';
import '../../../../core/constant/app_size_constat.dart';
import '../../controller/register_cubit/register_cubit.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController userNameController;
  final GlobalKey<FormState> formKey;
  final RegisterCubit cubit;

  const RegisterForm(
      {Key? key,
      required this.phoneController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.userNameController,
      required this.formKey,
      required this.cubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.65,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            border: Border.all(
              color: AppColorConstant.borderColor,
              width: AppSizeConstant.borderContainerWidth,
            ),
            borderRadius: BorderRadius.circular(AppSizeConstant.borderRadius)),
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Username',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextFormField(
                  cursorColor: AppColorConstant.signInColor,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                  controller: userNameController,
                  keyboardType: TextInputType.name,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Username is too small';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.001
                ),
                Text(
                  'Phone',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
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
                      return 'Phone number is too small';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.001
                ),
                Text(
                  'Password',
                  style: Theme.of(context).textTheme.bodyMedium
                ),
                TextFormField(
                  cursorColor: AppColorConstant.signInColor,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          cubit.changeVisibility();
                        },
                        icon: Icon(
                          cubit.visibility,
                          color: Colors.grey,
                        )),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.001
                ),
                Text(
                  'Confirm password',
                  style: Theme.of(context).textTheme.bodyMedium
                ),
                TextFormField(
                  cursorColor: AppColorConstant.signInColor,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          cubit.changeConfirmVisibility();
                        },
                        icon: Icon(
                         cubit.confirmVisibility,
                          color: Colors.grey,
                        )),
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                  obscureText: cubit.confirmObscureText,
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (String? value) {
                    if (confirmPasswordController.text !=
                        passwordController.text) {
                      return 'Password incorrect';
                    }
                    return null;
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
