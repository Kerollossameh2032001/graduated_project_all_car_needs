import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduated_project_all_car_needs/authentication/presentation/screens/splash_screen.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_string_constants.dart';
import 'package:graduated_project_all_car_needs/core/global/theme/light_theme.dart';
import 'package:graduated_project_all_car_needs/core/services/service_locator.dart';
import 'package:graduated_project_all_car_needs/layout/presentation/screen/home_screen.dart';

import 'authentication/presentation/screens/create_new_password_screen.dart';
import 'core/services/bloc_observer.dart';
import 'core/services/dio_helper.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // BaseAuthDataSource baseAuthDataSource = AuthDataSource();
  // BaseAuthRepository baseAuthRepository = AuthRepository(baseAuthDataSource);
  // var result = await LoginUseCase(baseAuthRepository).call(
  //     const LoginParameter(phone: '01122002942', password: '12345'));
  //print(result.fold((l) => print(l), (r) => print(r)));

  DioHelper.init();
  ServiceLocator.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStringConstant.appName,
      theme: getLightThemeData,
      debugShowCheckedModeBanner: false,
      home: HomeScreen()//const SplashScreen(),
    );
  }
}
