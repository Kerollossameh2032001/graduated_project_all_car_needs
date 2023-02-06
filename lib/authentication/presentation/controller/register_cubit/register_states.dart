import 'package:equatable/equatable.dart';
import 'package:graduated_project_all_car_needs/authentication/domain/entities/auth_entity.dart';

abstract class RegisterStates extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final AuthEntity userData;

  RegisterSuccessState({required this.userData});

  @override
  List<Object> get props => [userData];
}

class RegisterErrorState extends RegisterStates {
  final String errorMessage;

  RegisterErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class RegisterDisActiveVisibilityState extends RegisterStates {}

class RegisterActiveVisibilityState extends RegisterStates {}

class RegisterConfirmDisActiveVisibilityState extends RegisterStates {}

class RegisterConfirmActiveVisibilityState extends RegisterStates {}
