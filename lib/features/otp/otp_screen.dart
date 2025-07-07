import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:maps_flutter/features/otp/widgets/otp_intro_texts.dart';
import 'package:maps_flutter/features/otp/widgets/phone_verification_bloc.dart';
import 'package:maps_flutter/features/otp/widgets/pin_code_fields.dart';
import 'package:maps_flutter/features/otp/widgets/verify_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otpCode = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 88.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                OtpIntroText(phoneNumber: widget.phoneNumber),
                Gap(88.h),
                PinCodeFields(
                  onCompleted: (code) {
                    otpCode = code;
                  },
                ),
                Gap(60.h),
                VerifyButton(otpCodeGetter: () => otpCode),
                PhoneVerificationBloc(
                  phoneNumberGetter: () => widget.phoneNumber,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
