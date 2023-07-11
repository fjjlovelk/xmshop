import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';

class HomeCategorySwiper extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  HomeCategorySwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 450.h,
      child: Obx(
        () => Swiper(
          itemBuilder: (BuildContext context, int swiperIndex) {
            return GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              itemBuilder: (ctx, gridIndex) {
                final index = swiperIndex * 10 + gridIndex;
                return _buildItem(
                  homeController.categoryList[index].picUrl,
                  homeController.categoryList[index].title,
                );
              },
            );
          },
          itemCount: homeController.categoryList.length ~/ 10,
        ),
      ),
    );
  }

  Widget _buildItem(String url, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FadeInImage.memoryNetwork(
          width: 145.w,
          height: 145.w,
          fit: BoxFit.fitHeight,
          placeholder: kTransparentImage,
          image: url,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 32.sp),
        ),
      ],
    );
  }
}
