import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xmshop/app/config/theme_config.dart';

class TileItem extends StatelessWidget {
  final String title;
  final String subTitle;
  const TileItem({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(subTitle),
            const Icon(
              Icons.chevron_right,
              color: ThemeConfig.grey2,
            )
          ],
        ),
      ),
    );
  }
}
