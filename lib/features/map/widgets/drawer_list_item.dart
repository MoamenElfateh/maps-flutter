import 'package:flutter/material.dart';
import 'package:maps_flutter/core/theming/my_colors.dart';

class DrawerListItem extends StatelessWidget {
  const DrawerListItem({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.trailing,
    this.onTap,
    this.color,
  });
  final IconData leadingIcon;
  final String title;
  final Widget? trailing;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon, color: color ?? MyColors.blue),
      title: Text(title),
      trailing: trailing ?? Icon(Icons.arrow_right, color: MyColors.blue),
      onTap: onTap,
    );
  }
}
