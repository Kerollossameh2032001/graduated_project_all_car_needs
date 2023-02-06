import 'package:get_it/get_it.dart';
import 'package:graduated_project_all_car_needs/authentication/domain/usecase/login_usecase.dart';
import 'package:graduated_project_all_car_needs/authentication/presentation/controller/login_cubit/login_cubit.dart';
import 'package:graduated_project_all_car_needs/authentication/presentation/controller/register_cubit/register_cubit.dart';
import '../../authentication/data/data_source/auth_data_source.dart';
import '../../authentication/data/repository/auth_repository.dart';
import '../../authentication/domain/base_repository/base_auth_repository.dart';
import '../../authentication/domain/usecase/register_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    ///Cubit
    sl.registerFactory(()=>LoginCubit(sl()));
    sl.registerFactory(()=>RegisterCubit(sl()));

    ///Auth_Use_Case
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
    sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));

    ///Auth_repository
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));

    ///Auth_Data_source
    sl.registerLazySingleton<BaseAuthDataSource>(() => AuthDataSource());
  }
}
