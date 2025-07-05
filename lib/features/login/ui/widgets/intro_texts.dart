import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class IntroTexts extends StatelessWidget {
  const IntroTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What is your phone number?",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap(30.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          child: Text(
            "Please enter your phone number to verify your account.",
            style: TextStyle(color: Colors.black, fontSize: 18.sp),
          ),
        ),
      ],
    );
  }
}
