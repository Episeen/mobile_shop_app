import 'package:flutter/material.dart';
import 'package:phone_selling_app/utils/app_colors.dart';

abstract class AppTextStyles {
  static const txt15w500 = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'MarkPro');

  static const txt25w700 = TextStyle(
      fontSize: 25, fontWeight: FontWeight.w700, fontFamily: 'MarkPro');

  static const txt15w400orange =
      TextStyle(color: AppColors.colorOrange, fontSize: 15, fontWeight: FontWeight.w400);

  static const txt11w400 = TextStyle(fontSize: 11, fontWeight: FontWeight.w400);
  static const txt12w500 = TextStyle(fontSize: 12, fontWeight: FontWeight.w500);
  static const txt13w700 = TextStyle(fontSize: 13, fontWeight: FontWeight.w700);
  static const txt16w500 = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  static const txt18w500 = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  static const txt35w700 = TextStyle(fontSize: 35, fontWeight: FontWeight.w700);
  static const txt20w500 = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
  static const txt20w700 = TextStyle(fontSize: 20, fontWeight: FontWeight.w700);
  static const txt22w500 = TextStyle(fontSize: 22, fontWeight: FontWeight.w500);
}
