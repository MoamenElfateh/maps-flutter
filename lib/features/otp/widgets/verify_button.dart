import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maps_flutter/business_logic/cubit/phone_auth_cubit.dart';

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
          surfaceTintColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        onPressed: () {
          showProgressIndicator(context);
          _login(context);
        },
        child: Text(
          "Verify",
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
      ),
    );
  }

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );

    showDialog(
      barrierColor: Colors.white.withValues(alpha: 0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }

  void _login(BuildContext context) {
    final otpCode = otpCodeGetter();
    BlocProvider.of<PhoneAuthCubit>(context).submitOTP(otpCode);
  }
}
