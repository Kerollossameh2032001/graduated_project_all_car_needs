import 'package:graduated_project_all_car_needs/authentication/data/models/client_model.dart';
import 'package:graduated_project_all_car_needs/authentication/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    //required super.status,
    required super.data,
    required super.section,
    required super.accessToken,
  });

factory AuthModel.formJson(Map<String, dynamic> json) => AuthModel(
      //status: json['status'],
      accessToken: json['access_token'],
      section: List<String>.from(json['sections'].map((e) => e)),
      data: ClientDataModel.fromJson(json['user_data']),
    );
}
/*
*
* "status": true,
    "message": "Login done successfully",
    "data": {
        "id": 16792,
        "name": "Kerollos Sameh Fouad",
        "email": "kerollos@gmail.com",
        "phone": "1232202456",
        "image": "https://student.valuxapps.com/storage/assets/defaults/user.jpg",
        "points": 0,
        "credit": 0,
        "token": "mfvQei1kBrXaTvXNk46sq5X16iPpZMg6l1rQocX28pQdCj99rLHW9rikEl8vMAVa1kcFc0"
    }
* */
