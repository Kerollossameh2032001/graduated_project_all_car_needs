import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduated_project_all_car_needs/authentication/presentation/components/global_componant/navigate_to.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_color_constant.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_size_constat.dart';

import '../../../core/global/widgets/show_flutter_toast.dart';
import '../../../core/services/service_locator.dart';
import '../components/register_components/register_form.dart';
import '../controller/register_cubit/register_cubit.dart';
import '../controller/register_cubit/register_states.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          registerCheckStates(state, context);
        },
        builder: (context, state) {
          RegisterCubit cubit = RegisterCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      'assets/images/register.jpg',
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'REGISTER',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      RegisterForm(
                        cubit: cubit,
                        phoneController: phoneController,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                        userNameController: userNameController,
                        formKey: formKey,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            border: Border.all(
                              color: AppColorConstant.borderColor,
                              width: AppSizeConstant.borderContainerWidth,
                            ),
                            borderRadius: BorderRadius.circular(
                                AppSizeConstant.borderRadius)),
                        child: MaterialButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.register(
                                name: userNameController.text,
                                phone: phoneController.text,
                                password: passwordController.text,
                                passwordConfirmation:
                                    confirmPasswordController.text,
                              );
                            }
                          },
                          child: Text(
                            'Register',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .color),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                         navigateTo(context, LoginScreen());
                        },
                        child: Text(
                          'Already have an account?',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void registerCheckStates(RegisterStates state, BuildContext context) {
    if (state is RegisterLoadingState) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        ),
      );
    } else if (state is RegisterErrorState) {
      showFlutterToast(message: state.errorMessage, state: ToastState.error);
      Navigator.of(context).pop();
    } else if (state is RegisterSuccessState) {
      showFlutterToast(
          message: "Welcome ${state.userData.data.name}",
          state: ToastState.success);
      Navigator.pop(context);
    }
  }
}
