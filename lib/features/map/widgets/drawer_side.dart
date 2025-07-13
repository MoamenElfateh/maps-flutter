import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:maps_flutter/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:maps_flutter/core/routing/routes.dart';
import 'package:maps_flutter/features/map/widgets/drawer_header_widget.dart';
import 'package:maps_flutter/features/map/widgets/drawer_list_item.dart';
import 'package:maps_flutter/features/map/widgets/drawer_list_items_divider.dart';
import 'package:maps_flutter/features/map/widgets/inkwell_social_media_icons.dart';

class DrawerSide extends StatelessWidget {
  DrawerSide({super.key});

  final PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 280,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue[100]),
              child: DrawerHeaderWidget(),
            ),
          ),
          DrawerListItem(leadingIcon: Icons.person, title: "Profile"),
          DrawerListItemsDivider(),

          DrawerListItem(
            leadingIcon: Icons.history,
            title: "Places History",
            onTap: () {},
          ),
          DrawerListItemsDivider(),

          DrawerListItem(leadingIcon: Icons.settings, title: "Settings"),
          DrawerListItemsDivider(),

          DrawerListItem(leadingIcon: Icons.help, title: "Help"),
          DrawerListItemsDivider(),

          BlocProvider<PhoneAuthCubit>(
            create: (context) => phoneAuthCubit,
            child: DrawerListItem(
              leadingIcon: Icons.logout,
              title: "Log Out",
              onTap: () async {
                await phoneAuthCubit.logOut();
                if (!context.mounted) return;
                Navigator.of(context).pushReplacementNamed(Routes.loginScreen);
              },
              color: Colors.red,
              trailing: SizedBox(),
            ),
          ),
          Gap(180.h),
          ListTile(
            leading: Text("Follow Us", style: TextStyle(color: Colors.grey)),
          ),
          InkWellSocialMediaIcons(),
        ],
      ),
    );
  }
}
