import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:maps_flutter/core/theming/my_colors.dart';

class OtpIntroText extends StatelessWidget {
  const OtpIntroText({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Verify your phone number",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap(30.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          child: RichText(
            text: TextSpan(
              text: "Enter your 6 digits code number sent to",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                height: 1.4,
              ),
              children: [
                TextSpan(
                  text: phoneNumber,
                  style: TextStyle(color: MyColors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
