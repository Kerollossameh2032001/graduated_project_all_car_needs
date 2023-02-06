import 'package:flutter/material.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_color_constant.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_size_constat.dart';
import 'package:graduated_project_all_car_needs/core/constant/app_string_constants.dart';

ThemeData getLightThemeData = ThemeData(
  primaryColor: Colors.grey,
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontFamily: AppStringConstant.cairoFont,
      fontWeight: FontWeight.bold,
      fontSize: AppSizeConstant.titleMediumSize,
      color: AppColorConstant.titleMedLightColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: AppStringConstant.cairoFont,
      color: AppColorConstant.bodyMedLightColor,
      fontSize: AppSizeConstant.bodyMediumSize,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
        fontFamily: AppStringConstant.cairoFont,
        color: AppColorConstant.titleMedLightColor,
        fontSize: AppSizeConstant.bodySmallSize,
        fontWeight: FontWeight.bold),
  ),
);
