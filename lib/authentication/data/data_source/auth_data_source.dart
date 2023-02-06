import 'package:dio/dio.dart';
import 'package:graduated_project_all_car_needs/authentication/data/models/auth_model.dart';
import 'package:graduated_project_all_car_needs/authentication/domain/entities/auth_entity.dart';
import 'package:graduated_project_all_car_needs/authentication/domain/usecase/login_usecase.dart';
import 'package:graduated_project_all_car_needs/authentication/domain/usecase/register_usecase.dart';
import 'package:graduated_project_all_car_needs/core/constant/api_consants.dart';
import 'package:graduated_project_all_car_needs/core/exceptions/error_message_model.dart';
import 'package:graduated_project_all_car_needs/core/exceptions/exceptions.dart';

import '../../../core/services/dio_helper.dart';


abstract class BaseAuthDataSource {
  Future<AuthEntity> login(LoginParameter parameter);

  Future<AuthEntity> register(RegisterParameter parameter);
}

class AuthDataSource extends BaseAuthDataSource {
  @override
  Future<AuthEntity> login(LoginParameter parameter) async {
    try {
      var response = await DioHelper.postData(
        endPoint: ApiConstants.loginEndPoint,
        data: {'phone': parameter.phone, 'password': parameter.password},
      );
      return AuthModel.formJson(response.data);
    } on DioError catch (e) {
      if (e.response!.data is Map) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
        );
      } else {
        throw ServerException(
          errorMessageModel: const ErrorMessageModel(message: "Something went wrong "),
        );
      }
    }
    //throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }


  @override
  Future<AuthEntity> register(RegisterParameter parameter) async {
    try {
      var response = await DioHelper.postData(
          endPoint: ApiConstants.registerEndPoint,
          data: {
            'name': parameter.name,
            'phone': parameter.phone,
            'password': parameter.password,
            'password_confirmation': parameter.passwordConfirmation,
          });
      return AuthModel.formJson(response.data);
    } on DioError catch (e) {
      if (e.response!.data is Map) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response!.data),
        );
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel(message: e.message),
        );
      }
    }
  }
}
