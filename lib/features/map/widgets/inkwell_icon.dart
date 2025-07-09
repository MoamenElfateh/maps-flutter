import 'package:flutter/material.dart';
import 'package:maps_flutter/core/theming/my_colors.dart';
import 'package:maps_flutter/helpers/launch_url_helper.dart';

class InkWellIcon extends StatefulWidget {
  const InkWellIcon({super.key, required this.icon, required this.url});

  final IconData icon;
  final Uri url;

  @override
  State<InkWellIcon> createState() => _InkWellIconState();
}

class _InkWellIconState extends State<InkWellIcon> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => LaunchUrlHelper.launchURL(widget.url),
      child: Icon(widget.icon, color: MyColors.blue, size: 35),
    );
  }
}
