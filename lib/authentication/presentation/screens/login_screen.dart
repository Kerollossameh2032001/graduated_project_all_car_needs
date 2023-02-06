import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduated_project_all_car_needs/authentication/presentation/controller/login_cubit/login_cubit.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_size_constat.dart';
import '../../../core/global/widgets/show_flutter_toast.dart';
import '../../../core/services/service_locator.dart';
import '../components/login_conponents/login_form.dart';
import '../components/login_conponents/navigate_to_register_button.dart';
import '../controller/login_cubit/login_states.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          loginCheckStates(state, context);
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      'assets/images/sign in.jpg',
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
                        'LOG IN',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
                      LoginForm(
                          cubit: cubit,
                          formKey: formKey,
                          phoneController: phoneController,
                          passwordController: passwordController),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            border: Border.all(color: Colors.white, width: 3),
                            borderRadius: BorderRadius.circular(
                                AppSizeConstant.borderRadius)),
                        child: MaterialButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.login(
                                  phone: phoneController.text,
                                  password: passwordController.text);
                            }
                          },
                          child: Text(
                            'Log in',
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
                      const NavigateToRegisterScreen(),
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
  void loginCheckStates(LoginStates state, BuildContext context) {
    if (state is LoginLoadingState) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        ),
      );
    } else if (state is LoginErrorState) {
      showFlutterToast(message: state.errorMessage, state: ToastState.error);
      Navigator.of(context).pop();
    } else if (state is LoginSuccessState) {
      showFlutterToast(
          message: "Welcome ${state.userData.data.name}",
          state: ToastState.success);
      Navigator.pop(context);

    }
  }
}

