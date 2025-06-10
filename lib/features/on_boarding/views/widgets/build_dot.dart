import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildDot(bool isActive) {
  return Container(
    margin: EdgeInsets.only(right: 6.w),
    height: 8.h,
    width: isActive ? 24.w : 8.w,
    decoration: BoxDecoration(
      color: isActive ? const Color(0xff47B4EA) : Colors.grey.shade300,
      borderRadius: BorderRadius.circular(8.r),
    ),
  );
}
