import 'package:equatable/equatable.dart';
import 'client_data.dart';

class AuthEntity extends Equatable {
  //final bool status;
  final String accessToken;
  final List<String> section;
  final ClientData data;

  const AuthEntity({
    //required this.status,
    required this.data,
    required this.section,
    required this.accessToken,
  });

  @override
  List<Object> get props => [accessToken, section, data];
}
