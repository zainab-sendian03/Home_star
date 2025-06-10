import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static TextStyle f58semibold = const TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: 'Poppins');

  static TextStyle f41Regular = TextStyle(
      fontSize: 37.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: 'Poppins');

  static TextStyle f14Regular = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: 'Poppins');

  static TextStyle f24Bold = TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
      fontFamily: 'Poppins');
}
