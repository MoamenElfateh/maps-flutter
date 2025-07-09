import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:maps_flutter/features/map/widgets/inkwell_icon.dart';

class InkWellSocialMediaIcons extends StatelessWidget {
  const InkWellSocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16),
      child: Row(
        children: [
          InkWellIcon(
            icon: FontAwesomeIcons.facebook,
            url: Uri(scheme: "https", host: "facebook.com"),
          ),
          Gap(15.w),
          InkWellIcon(
            icon: FontAwesomeIcons.instagram,
            url: Uri(scheme: "https", host: "instagram.com"),
          ),
        ],
      ),
    );
  }
}
