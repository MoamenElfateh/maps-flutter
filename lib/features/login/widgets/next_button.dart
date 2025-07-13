import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maps_flutter/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:maps_flutter/helpers/progress_indicator_helper.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.phoneFormKey,
    required this.phoneNumberGetter,
  });
  final GlobalKey<FormState> phoneFormKey;
  final String Function() phoneNumberGetter;

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
          _register(context);
        },
        child: Text(
          "Next",
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
      ),
    );
  }

  Future<void> _register(BuildContext context) async {
    if (!phoneFormKey.currentState!.validate()) {
      Navigator.pop(context);
      return;
    } else {
      Navigator.pop(context);
      phoneFormKey.currentState!.save();
      final phoneNumber = phoneNumberGetter();
      BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumber(phoneNumber);
    }
  }
}
