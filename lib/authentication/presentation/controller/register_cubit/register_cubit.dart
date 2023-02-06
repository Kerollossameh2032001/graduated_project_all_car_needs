import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduated_project_all_car_needs/authentication/presentation/controller/register_cubit/register_states.dart';
import '../../../domain/usecase/register_usecase.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase) : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool obscureText = true;
  IconData visibility = Icons.visibility_off_outlined;

  void changeVisibility() {
    obscureText = !obscureText;
    visibility =
        obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    obscureText
        ? emit(RegisterDisActiveVisibilityState())
        : emit(RegisterActiveVisibilityState());
  }

  bool confirmObscureText = true;
  IconData confirmVisibility = Icons.visibility_off_outlined;

  void changeConfirmVisibility() {
    confirmObscureText = !confirmObscureText;
    confirmVisibility =
        confirmObscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    confirmObscureText
        ? emit(RegisterConfirmDisActiveVisibilityState())
        : emit(RegisterConfirmActiveVisibilityState());
  }

  void register({
    required String name,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(RegisterLoadingState());
    RegisterParameter parameter = RegisterParameter(
      name: name,
      phone: phone,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
    var result = await registerUseCase(parameter);
    result.fold(
      (l) => emit(RegisterErrorState(errorMessage: l.message)),
      (r) => emit(RegisterSuccessState(userData: r)),
    );
  }
}
