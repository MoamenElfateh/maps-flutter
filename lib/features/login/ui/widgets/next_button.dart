import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(110.w, 50.h),
          surfaceTintColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        onPressed: () {},
        child: Text(
          "Next",
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
      ),
    );
  }
}
