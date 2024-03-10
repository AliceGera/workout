import 'package:flutter/material.dart';

enum AppTextStyle {
  light10(TextStyle(fontSize: 10, height: 1.1, fontWeight: FontWeight.w300, fontFamily: 'Raleway')),
  light12(TextStyle(fontSize: 12, height: 1.4, fontWeight: FontWeight.w300, fontFamily: 'Raleway')),
  light13(TextStyle(fontSize: 13, height: 1.2, fontWeight: FontWeight.w300, fontFamily: 'Raleway')),

  regular10(TextStyle(fontSize: 10, height: 1.14, fontWeight: FontWeight.w400, fontFamily: 'Raleway')),
  regular12(TextStyle(fontSize: 12, height: 1.5, fontWeight: FontWeight.w400, fontFamily: 'Raleway')),

  regular13(TextStyle(fontSize: 13, height: 1.38, fontWeight: FontWeight.w400, fontFamily: 'YanoneKaffeesatz')),
  regular14(TextStyle(fontSize: 14, height: 1.4, fontWeight: FontWeight.w400, fontFamily: 'YanoneKaffeesatz')),
  regular28(TextStyle(fontSize: 28, height: 1.6, fontWeight: FontWeight.w400, fontFamily: 'YanoneKaffeesatz')),
  regular24(TextStyle(fontSize: 24, height: 1.1, fontWeight: FontWeight.w400, fontFamily: 'YanoneKaffeesatz')),

  regular15(TextStyle(fontSize: 15, height: 1.2, fontWeight: FontWeight.w400, fontFamily: 'YanoneKaffeesatz')),
  superLight12(TextStyle(fontSize: 12, height: 2, fontWeight: FontWeight.w200, fontFamily: 'YanoneKaffeesatz')),
  medium10(TextStyle(fontSize: 10, height: 1.17, fontWeight: FontWeight.w500, fontFamily: 'YanoneKaffeesatz')),
  medium13(TextStyle(fontSize: 13, height: 1.53, fontWeight: FontWeight.w500, fontFamily: 'YanoneKaffeesatz')),
  medium12(TextStyle(fontSize: 12, height: 1.33, fontWeight: FontWeight.w500, fontFamily: 'YanoneKaffeesatz')),
  medium14(TextStyle(fontSize: 14, height: 1.64, fontWeight: FontWeight.w500, fontFamily: 'YanoneKaffeesatz')),
  medium15(TextStyle(fontSize: 15, height: 1.6, fontWeight: FontWeight.w500, fontFamily: 'YanoneKaffeesatz')),
  medium16(TextStyle(fontSize: 16, height: 1.4, fontWeight: FontWeight.w500, fontFamily: 'YanoneKaffeesatz')),
  medium17(TextStyle(fontSize: 17, height: 1.41, fontWeight: FontWeight.w500, fontFamily: 'YanoneKaffeesatz')),
  medium18(TextStyle(fontSize: 18, height: 1.33, fontWeight: FontWeight.w500, fontFamily: 'YanoneKaffeesatz')),
  medium20(TextStyle(fontSize: 20, height: 1.25, fontWeight: FontWeight.w500, fontFamily: 'YanoneKaffeesatz')),
  medium22(TextStyle(fontSize: 22, height: 1.125, fontWeight: FontWeight.w500, fontFamily: 'YanoneKaffeesatz')),
  medium28(TextStyle(fontSize: 28, height: 1.125, fontWeight: FontWeight.w500, fontFamily: 'YanoneKaffeesatz')),
  medium26(TextStyle(fontSize: 26, height: 1.125, fontWeight: FontWeight.w500, fontFamily: 'YanoneKaffeesatz')),

  semiBold16(TextStyle(fontSize: 16, height: 1.8, fontWeight: FontWeight.w600, fontFamily: 'YanoneKaffeesatz')),
  semiBold18(TextStyle(fontSize: 18, height: 1.8, fontWeight: FontWeight.w600, fontFamily: 'YanoneKaffeesatz')),
  semiBold20(TextStyle(fontSize: 20, height: 1.2, fontWeight: FontWeight.w600, fontFamily: 'YanoneKaffeesatz')),
  semiBold22(TextStyle(fontSize: 22, height: 2.5, fontWeight: FontWeight.w600, fontFamily: 'YanoneKaffeesatz')),

  semiBold28(TextStyle(fontSize: 28, height: 1.39, fontWeight: FontWeight.w600, fontFamily: 'YanoneKaffeesatz')),
  semiBold32(TextStyle(fontSize: 32, height: 1.1, fontWeight: FontWeight.w600, fontFamily: 'YanoneKaffeesatz')),

  semiBold24(TextStyle(fontSize: 24, height: 1.1, fontWeight: FontWeight.w600)),
  bold14(TextStyle(fontSize: 14, height: 1.40, fontWeight: FontWeight.w700)),
  bold16(TextStyle(fontSize: 16, height: 1.24, fontWeight: FontWeight.w700)),
  bold32(TextStyle(fontSize: 32, height:1, fontWeight: FontWeight.w700));

  final TextStyle value;

  const AppTextStyle(this.value);
}
