import 'package:flutter/material.dart';

const fontFamily = "SFProDisplay";

abstract class AppTextStyles {
  static const zero = TextStyle(fontSize: 0.01);

  static const text14m = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  static const title3m = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
  static const text14r = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w200,
    fontFamily: fontFamily,
  );
  static const text18r = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w200,
    fontFamily: fontFamily,
    color: Colors.black,
  );
  static const text12r = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
    color: Colors.grey
  );
  static const text16m = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );
  static const title1 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );
  static const text20m = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );
  static const text28r = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
    color: Colors.white
  );
  static const text16s = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w200,
    fontFamily: fontFamily,
  );
}