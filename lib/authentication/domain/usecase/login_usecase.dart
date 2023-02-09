import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:graduated_project_all_car_needs/authentication/domain/base_repository/base_auth_repository.dart';
import 'package:graduated_project_all_car_needs/authentication/domain/entities/auth_entity.dart';
import 'package:graduated_project_all_car_needs/core/global/base_usecase/base_usecase.dart';

import '../../../core/exceptions/failure.dart';



class LoginUseCase extends BaseUseCase<AuthEntity, LoginParameter> {

  final BaseAuthRepository baseAuthRepository;

  LoginUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure,AuthEntity>> call(LoginParameter parameter) async {
    return await baseAuthRepository.login(parameter);
  }
}

class LoginParameter extends Equatable {
  final String phone;
  final String password;

  const LoginParameter({
    required this.phone,
    required this.password,
  });

  @override
  List<Object> get props => [phone, password];
}
