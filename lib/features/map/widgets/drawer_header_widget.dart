import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:maps_flutter/business_logic/cubit/phone_auth/phone_auth_cubit.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsetsDirectional.fromSTEB(70, 10, 70, 10),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.blue[100],
            ),
            child: Image.asset("assets/images/moamen.jpeg", fit: BoxFit.cover),
          ),
        ),
        Text(
          "Moamen Elfateh",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        Gap(5.h),
        BlocProvider<PhoneAuthCubit>(
          create: (context) => phoneAuthCubit,
          child: Text(
            phoneAuthCubit.getLoggedInUser().phoneNumber.toString(),
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
