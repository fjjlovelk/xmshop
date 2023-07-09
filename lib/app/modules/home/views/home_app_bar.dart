import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/config/theme_config.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';
import 'package:xmshop/app/utils/ali_fonts.dart';

class HomeAppBar extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Obx(
        () => AppBar(
          titleSpacing: 0,
          titleTextStyle: TextStyle(fontSize: 40.sp, color: Colors.grey[400]),
          backgroundColor: homeController.showAppBarBackground.value
              ? Colors.white
              : Colors.transparent,
          foregroundColor: homeController.showAppBarBackground.value
              ? Colors.black
              : Colors.white,
          elevation: 0,
          leading: homeController.showAppBarBackground.value
              ? null
              : const Icon(
                  AliFonts.xiaomi,
                  size: 30,
                ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.messenger_outline),
            ),
          ],
          title: _buildTitle(),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: homeController.showAppBarBackground.value ? 780.w : 700.w,
      height: 96.h,
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      decoration: BoxDecoration(
        color: homeController.showAppBarBackground.value
            ? ThemeConfig.grey
            : ThemeConfig.grey.withOpacity(0.9),
        borderRadius: BorderRadius.circular(60.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.search, color: Colors.grey[400]),
              const Text('手机'),
            ],
          ),
          Icon(Icons.camera_alt_outlined, color: Colors.grey[400]),
        ],
      ),
    );
  }
}
