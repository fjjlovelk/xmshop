import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';

class HomeGoodsGrid extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  HomeGoodsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.w, 0, 30.w, 30.w),
      child: Obx(
        () => MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20.w,
          crossAxisSpacing: 20.w,
          itemCount: homeController.gridGoodsList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = homeController.gridGoodsList[index];
            return _buildItem(
              item.sPicUrl,
              item.title,
              item.subTitle,
              '￥${item.price}',
            );
          },
        ),
      ),
    );
  }

  Widget _buildItem(String url, String title, String subTitle, String price) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(url, fit: BoxFit.fitWidth),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5.h),
            Text(subTitle, style: TextStyle(fontSize: 30.sp)),
            SizedBox(height: 5.h),
            Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
