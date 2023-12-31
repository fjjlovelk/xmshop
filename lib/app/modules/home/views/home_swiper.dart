import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';

class HomeSwiper extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  HomeSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 700.h,
      child: Obx(
        () => Swiper(
          itemBuilder: (BuildContext context, int index) {
            return FadeInImage.memoryNetwork(
              fit: BoxFit.fill,
              placeholder: kTransparentImage,
              image: homeController.swiperList[index].picUrl,
            );
          },
          itemCount: homeController.swiperList.length,
          pagination: const SwiperPagination(),
          autoplay: true,
        ),
      ),
    );
  }
}
