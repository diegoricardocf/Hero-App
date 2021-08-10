import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyle {
  static TextStyle title() {
    return TextStyle(
        color: AppColors.title, fontWeight: FontWeight.bold, fontSize: 32);
  }

  static TextStyle subtitle() {
    return TextStyle(
        color: AppColors.title, fontWeight: FontWeight.normal, fontSize: 16);
  }

  static TextStyle noContentTitle() {
    return TextStyle(
        color: AppColors.title, fontWeight: FontWeight.bold, fontSize: 20);
  }

  static TextStyle noContentSubTitle() {
    return TextStyle(
        color: AppColors.title, fontWeight: FontWeight.normal, fontSize: 16);
  }

  static TextStyle textField() {
    return TextStyle(color: AppColors.textFieldHint);
  }

  static TextStyle cardTitle() {
    return TextStyle(
        color: AppColors.cardTitle, fontWeight: FontWeight.bold, fontSize: 20);
  }

  static TextStyle cardContent() {
    return TextStyle(
        color: AppColors.cardContent,
        fontWeight: FontWeight.normal,
        fontSize: 14);
  }

  static TextStyle appBarTitle() {
    return TextStyle(
        color: AppColors.appBarTitle,
        fontWeight: FontWeight.bold,
        fontSize: 22);
  }

  static TextStyle powerTitle() {
    return TextStyle(
        color: AppColors.cardTitle,
        fontWeight: FontWeight.normal,
        fontSize: 14);
  }

  static TextStyle powerContent() {
    return TextStyle(
        color: AppColors.cardContent,
        fontWeight: FontWeight.bold,
        fontSize: 20);
  }

  static InputDecoration textFieldInputDecoration(String hint) {
    return InputDecoration(
      labelText: hint,
      fillColor: Colors.white,
      filled: true,
      focusColor: AppColors.textFieldHint,
      labelStyle: TextStyle(color: AppColors.textFieldHint),
    );
  }
}
