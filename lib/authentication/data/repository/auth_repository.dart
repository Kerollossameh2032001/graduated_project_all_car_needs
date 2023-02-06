import 'package:dartz/dartz.dart';
import 'package:graduated_project_all_car_needs/authentication/data/data_source/auth_data_source.dart';
import 'package:graduated_project_all_car_needs/authentication/domain/base_repository/base_auth_repository.dart';
import 'package:graduated_project_all_car_needs/authentication/domain/entities/auth_entity.dart';
import 'package:graduated_project_all_car_needs/authentication/domain/usecase/login_usecase.dart';
import 'package:graduated_project_all_car_needs/authentication/domain/usecase/register_usecase.dart';
import 'package:graduated_project_all_car_needs/core/exceptions/exceptions.dart';

import '../../../core/exceptions/failure.dart';

class AuthRepository extends BaseAuthRepository{
  final BaseAuthDataSource baseAuthDataSource;

  AuthRepository(this.baseAuthDataSource);

  @override

  Future<Either<Failure,AuthEntity>> login(LoginParameter parameter) async {

   try{
     var result = await baseAuthDataSource.login(parameter);
     return Right(result);
   } on ServerException catch(failure){
     return Left(ServerFailure(failure.errorMessageModel.message));
   }
  }

  @override
  Future<Either<Failure,AuthEntity>> register(RegisterParameter parameter) async {
    try{
      var result = await baseAuthDataSource.register(parameter);
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message!));
    }
  }
}