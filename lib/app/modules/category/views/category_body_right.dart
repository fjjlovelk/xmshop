import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:xmshop/app/modules/category/controllers/category_controller.dart';

class CategoryBodyRight extends StatelessWidget {
  final CategoryController categoryController = Get.find<CategoryController>();
  CategoryBodyRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => GridView.builder(
          itemCount: categoryController.rightData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 80.h,
          ),
          itemBuilder: (ctx, index) {
            return SizedBox(
              width: double.infinity,
              height: 260.h,
              child: Column(
                children: [
                  Expanded(
                    child: FadeInImage.memoryNetwork(
                      fit: BoxFit.fitHeight,
                      placeholder: kTransparentImage,
                      image: categoryController.rightData[index].picUrl,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Text(categoryController.rightData[index].title),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
