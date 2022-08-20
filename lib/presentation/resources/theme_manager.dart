import './color_manager.dart';
import './values_manager.dart';
import './styles_manager.dart';
import './font_manager.dart';

import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      // main colors of the app
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primary2,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      // ripple color
      splashColor: ColorManager.primary2,
      // will be used incase of disabled button for example
      // ignore: deprecated_member_use
      accentColor: ColorManager.grey,
      // card view theme
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: AppSize.s4),
      // App bar theme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.darkPrimary,
          elevation: AppSize.s0,
          shadowColor: ColorManager.primary2,
          titleTextStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s20)),

      //BottomNavigationBar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: ColorManager.darkPrimary,
        unselectedItemColor: ColorManager.darkGrey,
      ),

      //TabBar theme
      tabBarTheme: TabBarTheme(
        labelColor: ColorManager.darkPrimary,
        unselectedLabelColor: ColorManager.darkGrey,
      ),

      // Button theme
      buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          disabledColor: ColorManager.grey1,
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.primary2),

      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(color: ColorManager.white),
              primary: ColorManager.darkPrimary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12)))),

      //text button theme
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              textStyle: getRegularStyle(color: ColorManager.darkPrimary),
              primary: ColorManager.darkPrimary)),

      //outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              textStyle: getRegularStyle(color: ColorManager.darkPrimary),
              primary: ColorManager.darkPrimary)),

      // Text theme
      textTheme: TextTheme(
          headline1: getSemiBoldStyle(
              color: ColorManager.darkGrey, fontSize: FontSize.s16),
          subtitle1: getMediumStyle(
              color: ColorManager.lightGrey, fontSize: FontSize.s14),
          subtitle2: getMediumStyle(
              color: ColorManager.primary, fontSize: FontSize.s14),
          caption: getRegularStyle(color: ColorManager.grey1),
          bodyText1: getRegularStyle(color: ColorManager.grey)),
      // input decoration theme (text form field)

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle: getRegularStyle(color: ColorManager.grey1),
        iconColor: ColorManager.darkPrimary,
        labelStyle: getMediumStyle(color: ColorManager.darkPrimary),
        errorStyle: getRegularStyle(color: ColorManager.error),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.darkPrimary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.darkPrimary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.darkPrimary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      ));
}
