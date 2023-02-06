import 'package:graduated_project_all_car_needs/authentication/domain/entities/client_data.dart';

class ClientDataModel extends ClientData {
  const ClientDataModel({
    required super.name,
    required super.phone,
    required super.avatar,
    required super.bio,
    super.rolesName,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
  });

factory ClientDataModel.fromJson(Map<String, dynamic> json) =>
    ClientDataModel(
      name: json['name'],
      phone: json['phone'],
      avatar: json['avatar'],
      bio: json['bio'],
      rolesName: List<String>.from(json['roles_name']??[]),
      status: json['Status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
}
