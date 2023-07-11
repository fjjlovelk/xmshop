import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';

class HomeHotSale extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  HomeHotSale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        children: [
          _buildLeft(),
          SizedBox(width: 20.w),
          _buildRight(),
        ],
      ),
    );
  }

  // 左侧
  Widget _buildLeft() {
    return Container(
      width: 500.w,
      height: 735.h,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(248, 248, 248, 1),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Obx(
        () => Swiper(
          itemBuilder: (BuildContext context, int swiperIndex) {
            return FadeInImage.memoryNetwork(
              fit: BoxFit.fitHeight,
              placeholder: kTransparentImage,
              image: homeController.saleSwiperList[swiperIndex].picUrl,
            );
          },
          itemCount: homeController.saleSwiperList.length,
          autoplay: true,
        ),
      ),
    );
  }

  // 右侧
  Widget _buildRight() {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        height: 735.h,
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: homeController.saleGoodsList
                .map((item) => _buildRightItem(
                      item.title,
                      item.subTitle,
                      '￥${item.price}',
                      item.sPicUrl,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildRightItem(
      String title, String subTitle, String description, String url) {
    return Container(
      padding: EdgeInsets.fromLTRB(35.w, 25.h, 10.w, 10.h),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(248, 248, 248, 1),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 200.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subTitle,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: const Color.fromRGBO(99, 99, 99, 1),
                      fontSize: 30.sp,
                    ),
                  ),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: const Color.fromRGBO(99, 99, 99, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.w),
          FadeInImage.memoryNetwork(
            width: 155.w,
            height: 200.h,
            fit: BoxFit.fitHeight,
            placeholder: kTransparentImage,
            image: url,
          ),
        ],
      ),
    );
  }
}
