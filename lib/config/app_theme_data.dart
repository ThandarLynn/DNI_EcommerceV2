import 'package:dni_ecommerce_v2/config/app_config.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData themeData(ThemeData baseTheme) {
  //final baseTheme = ThemeData.light();

  if (baseTheme.brightness == Brightness.dark) {
    AppColors.loadColor2(false);

    // Dark Theme
    return baseTheme.copyWith(
      primaryColor: AppColors.mainColor,
      primaryColorDark: AppColors.mainDarkColor,
      primaryColorLight: AppColors.mainLightColor,
      textTheme: TextTheme(
        displayLarge: TextStyle(
            color: AppColors.textPrimaryColor,
            fontFamily: AppConfig.ps_default_font_family),
        displayMedium: TextStyle(
            color: AppColors.textPrimaryColor,
            fontFamily: AppConfig.ps_default_font_family),
        displaySmall: TextStyle(
            color: AppColors.textPrimaryColor,
            fontFamily: AppConfig.ps_default_font_family),
        headlineLarge: TextStyle(
          color: AppColors.textPrimaryColor,
          fontFamily: AppConfig.ps_default_font_family,
        ),
        headlineMedium: TextStyle(
            color: AppColors.textPrimaryColor,
            fontFamily: AppConfig.ps_default_font_family,
            fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(
            color: AppColors.textPrimaryColor,
            fontFamily: AppConfig.ps_default_font_family),
        titleMedium: TextStyle(
            color: AppColors.textPrimaryColor,
            fontFamily: AppConfig.ps_default_font_family,
            fontWeight: FontWeight.bold),
        titleSmall: TextStyle(
            color: AppColors.textPrimaryColor,
            fontFamily: AppConfig.ps_default_font_family,
            fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(
          color: AppColors.textPrimaryColor,
          fontFamily: AppConfig.ps_default_font_family,
        ),
        bodyMedium: TextStyle(
            color: AppColors.textPrimaryColor,
            fontFamily: AppConfig.ps_default_font_family,
            fontWeight: FontWeight.bold),
        labelLarge: TextStyle(
            color: AppColors.textPrimaryColor,
            fontFamily: AppConfig.ps_default_font_family),
        bodySmall: TextStyle(
            color: AppColors.textPrimaryLightColor,
            fontFamily: AppConfig.ps_default_font_family),
        labelSmall: TextStyle(
            color: AppColors.textPrimaryColor,
            fontFamily: AppConfig.ps_default_font_family),
      ),
      iconTheme: IconThemeData(color: AppColors.iconColor),
      appBarTheme: AppBarTheme(color: AppColors.coreBackgroundColor),
    );
  } else {
    AppColors.loadColor2(true);
    // White Theme
    return baseTheme.copyWith(
        primaryColor: AppColors.mainColor,
        primaryColorDark: AppColors.mainDarkColor,
        primaryColorLight: AppColors.mainLightColor,
        textTheme: TextTheme(
          displayLarge: TextStyle(
              color: AppColors.textPrimaryColor,
              fontFamily: AppConfig.ps_default_font_family),
          displayMedium: TextStyle(
              color: AppColors.textPrimaryColor,
              fontFamily: AppConfig.ps_default_font_family),
          displaySmall: TextStyle(
              color: AppColors.textPrimaryColor,
              fontFamily: AppConfig.ps_default_font_family),
          headlineLarge: TextStyle(
            color: AppColors.textPrimaryColor,
            fontFamily: AppConfig.ps_default_font_family,
          ),
          headlineMedium: TextStyle(
              color: AppColors.textPrimaryColor,
              fontFamily: AppConfig.ps_default_font_family,
              fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(
              color: AppColors.textPrimaryColor,
              fontFamily: AppConfig.ps_default_font_family),
          titleMedium: TextStyle(
              color: AppColors.textPrimaryColor,
              fontFamily: AppConfig.ps_default_font_family,
              fontWeight: FontWeight.bold),
          titleSmall: TextStyle(
              color: AppColors.textPrimaryColor,
              fontFamily: AppConfig.ps_default_font_family,
              fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(
            color: AppColors.textPrimaryColor,
            fontFamily: AppConfig.ps_default_font_family,
          ),
          bodyMedium: TextStyle(
              color: AppColors.textPrimaryColor,
              fontFamily: AppConfig.ps_default_font_family,
              fontWeight: FontWeight.bold),
          labelLarge: TextStyle(
              color: AppColors.textPrimaryColor,
              fontFamily: AppConfig.ps_default_font_family),
          bodySmall: TextStyle(
              color: AppColors.textPrimaryLightColor,
              fontFamily: AppConfig.ps_default_font_family),
          labelSmall: TextStyle(
              color: AppColors.textPrimaryColor,
              fontFamily: AppConfig.ps_default_font_family),
        ),
        iconTheme: IconThemeData(color: AppColors.iconColor),
        appBarTheme: AppBarTheme(color: AppColors.coreBackgroundColor));
  }
}
