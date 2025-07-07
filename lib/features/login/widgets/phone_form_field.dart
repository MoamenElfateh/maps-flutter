import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:maps_flutter/core/theming/my_colors.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({super.key, required this.onSaved});
  final void Function(String phone) onSaved;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.lightGrey),
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
            ),
            child: Text(
              "${generateCountryFlag()} +20",
              style: TextStyle(fontSize: 18.sp, letterSpacing: 2.0.w),
            ),
          ),
        ),
        Gap(16.w),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.blue),
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
            ),
            child: TextFormField(
              autofocus: true,
              style: TextStyle(fontSize: 18.sp, letterSpacing: 2.0.w),
              decoration: InputDecoration(border: InputBorder.none),
              cursorColor: Colors.black,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your phone number!";
                } else if (value.length < 11) {
                  return "Too short for a phone number!";
                }
                return null;
              },
              onSaved: (value) {
                onSaved(value!);
              },
            ),
          ),
        ),
      ],
    );
  }

  String generateCountryFlag() {
    String countryCode = "eg";
    String flag = countryCode.toUpperCase().replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
    );
    return flag;
  }
}
