import 'package:dartz/dartz.dart';
import 'package:graduated_project_all_car_needs/authentication/domain/usecase/login_usecase.dart';
import 'package:graduated_project_all_car_needs/authentication/domain/usecase/register_usecase.dart';
import '../../../core/exceptions/failure.dart';
import '../entities/auth_entity.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure,AuthEntity>> login(LoginParameter parameter);

  Future<Either<Failure,AuthEntity>> register(RegisterParameter parameter);
}
