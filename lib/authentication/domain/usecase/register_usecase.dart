import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:graduated_project_all_car_needs/authentication/domain/base_repository/base_auth_repository.dart';
import 'package:graduated_project_all_car_needs/authentication/domain/entities/auth_entity.dart';
import 'package:graduated_project_all_car_needs/core/global/base_usecase/base_usecase.dart';

import '../../../core/exceptions/failure.dart';

class RegisterUseCase extends BaseUseCase<AuthEntity, RegisterParameter> {
  final BaseAuthRepository baseAuthRepository;

  RegisterUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, AuthEntity>> call(RegisterParameter parameter) async {
    return await baseAuthRepository.register(parameter);
  }
}

class RegisterParameter extends Equatable {
  final String name;
  final String phone;
  final String password;
  final String passwordConfirmation;

  const RegisterParameter({
    required this.name,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
  });

  @override
  List<Object> get props => [name, password, phone, passwordConfirmation];
}
