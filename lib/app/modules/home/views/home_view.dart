import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/views/custom_app_bar.dart';
import 'package:xmshop/app/modules/home/views/swiper_content.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -(View.of(context).padding.top + 4).h,
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView(
              controller: controller.scrollController,
              children: [
                SwiperContent(),
              ],
            ),
          ),
          CustomAppBar(),
        ],
      ),
    );
  }
}
