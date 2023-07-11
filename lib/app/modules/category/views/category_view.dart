import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/config/theme_config.dart';
import 'package:xmshop/app/modules/category/views/category_body_left.dart';
import 'package:xmshop/app/modules/category/views/category_body_right.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Row(
        children: [
          CategoryBodyLeft(),
          CategoryBodyRight(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      titleSpacing: 0,
      titleTextStyle: TextStyle(fontSize: 40.sp, color: Colors.grey[400]),
      leadingWidth: 0,
      leading: null,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.messenger_outline),
        ),
      ],
      title: Container(
        width: 850.w,
        height: 96.h,
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        decoration: BoxDecoration(
          color: ThemeConfig.grey.withOpacity(0.9),
          borderRadius: BorderRadius.circular(60.r),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey[400]),
            const Text('搜索商品'),
          ],
        ),
      ),
    );
  }
}
