import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:maps_flutter/features/login/ui/widgets/intro_texts.dart';
import 'package:maps_flutter/features/login/ui/widgets/next_button.dart';
import 'package:maps_flutter/features/login/ui/widgets/phone_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _phoneFormKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 88.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntroTexts(),
                Gap(110.h),
                PhoneFormField(),
                Gap(70.h),
                NextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
