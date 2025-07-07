import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:maps_flutter/features/login/widgets/login_intro_texts.dart';
import 'package:maps_flutter/features/login/widgets/next_button.dart';
import 'package:maps_flutter/features/login/widgets/phone_form_field.dart';
import 'package:maps_flutter/features/login/widgets/phone_number_submitted_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();
  String phoneNumber = "";

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
                LoginIntroTexts(),
                Gap(110.h),
                PhoneFormField(
                  onSaved: (phone) {
                    phoneNumber = phone;
                  },
                ),
                Gap(70.h),
                NextButton(
                  phoneFormKey: _phoneFormKey,
                  phoneNumberGetter: () => phoneNumber,
                ),
                PhoneNumberSubmittedBloc(phoneNumberGetter: () => phoneNumber),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
