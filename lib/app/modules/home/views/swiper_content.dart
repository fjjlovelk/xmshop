import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';

class SwiperContent extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  SwiperContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 700.h,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            homeController.swiperList[index]['url']!,
            fit: BoxFit.fill,
          );
        },
        itemCount: homeController.swiperList.length,
        pagination: const SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
