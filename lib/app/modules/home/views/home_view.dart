import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/views/home_app_bar.dart';
import 'package:xmshop/app/modules/home/views/home_banner_image.dart';
import 'package:xmshop/app/modules/home/views/home_banner_text.dart';
import 'package:xmshop/app/modules/home/views/home_category_swiper.dart';
import 'package:xmshop/app/modules/home/views/home_hot_sale.dart';
import 'package:xmshop/app/modules/home/views/home_swiper.dart';

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
                HomeSwiper(),
                const HomeBannerText(),
                HomeCategorySwiper(),
                const HomeBannerImage(),
                const HomeHotSale(),
              ],
            ),
          ),
          HomeAppBar(),
        ],
      ),
    );
  }
}
