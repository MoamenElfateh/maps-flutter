import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maps_flutter/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:maps_flutter/helpers/progress_indicator_helper.dart';

class VerifyButton extends StatelessWidget {
  const VerifyButton({super.key, required this.otpCodeGetter});
  final String Function() otpCodeGetter;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(110.w, 50.h),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        onPressed: () {
          ProgressIndicatorHelper.showProgressIndicator(context);
          _login(context);
        },
        child: Text(
          "Verify",
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    final otpCode = otpCodeGetter();
    BlocProvider.of<PhoneAuthCubit>(context).submitOTP(otpCode);
  }
}
