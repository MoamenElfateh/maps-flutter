import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maps_flutter/core/theming/my_colors.dart';
import 'package:maps_flutter/data/models/place_suggestions.dart';

class SuggestionsPlacesListItem extends StatelessWidget {
  const SuggestionsPlacesListItem({super.key, required this.suggestions});
  final PlaceSuggestions suggestions;

  @override
  Widget build(BuildContext context) {
    var title = suggestions.description.split(",")[0];
    var subTitle =
        suggestions.description
            .replaceFirst("${suggestions.description.split(",")[0]},", "")
            .trim();
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.lightBlue,
              ),
              child: Icon(Icons.place, color: MyColors.blue),
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$title\n",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: subTitle,
                    style: TextStyle(color: Colors.black, fontSize: 16.sp),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
