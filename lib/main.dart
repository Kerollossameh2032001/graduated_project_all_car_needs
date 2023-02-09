import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduated_project_all_car_needs/authentication/presentation/screens/splash_screen.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_string_constants.dart';
import 'package:graduated_project_all_car_needs/core/global/theme/light_theme.dart';
import 'package:graduated_project_all_car_needs/core/services/cache_helper.dart';
import 'package:graduated_project_all_car_needs/core/services/service_locator.dart';
import 'package:graduated_project_all_car_needs/layout/presentation/screen/layout_screen.dart';
import 'core/services/bloc_observer.dart';
import 'core/services/dio_helper.dart';

void main() async {
  // BaseAuthDataSource baseAuthDataSource = AuthDataSource();
  // BaseAuthRepository baseAuthRepository = AuthRepository(baseAuthDataSource);
  // var result = await LoginUseCase(baseAuthRepository).call(
  //     const LoginParameter(phone: '01122002942', password: '12345'));
  //print(result.fold((l) => print(l), (r) => print(r)));
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  ServiceLocator.init();
  await CacheHelper.init();
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
      home: CacheHelper.getDate(key: 'token') == null
          ? const SplashScreen()
          : LayoutScreen(
              token: CacheHelper.getDate(key: 'token'),
            ),
    );
  }
}
