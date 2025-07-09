import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsetsDirectional.fromSTEB(70, 10, 70, 10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.blue[100],
          ),
          child: Image.asset("assets/images/moamen.jpeg", fit: BoxFit.cover),
        ),
        Text(
          "Moamen Elfateh",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        Gap(5.h),
        Text(
          "01027670404",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
