import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/category/controllers/category_controller.dart';

class CategoryBodyLeft extends StatelessWidget {
  final CategoryController categoryController = Get.find<CategoryController>();
  CategoryBodyLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260.w,
      height: double.infinity,
      child: Obx(
        () => ListView.builder(
          itemCount: categoryController.leftData.length,
          itemBuilder: (ctx, index) {
            return InkWell(
              onTap: () {
                categoryController.changeCurrentIndex(
                  index,
                  categoryController.leftData[index].id,
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 60.h),
                child: Obx(
                  () => Row(
                    children: [
                      Container(
                        width: 10.w,
                        height: 50.h,
                        color: categoryController.currentIndex.value == index
                            ? const Color.fromRGBO(252, 110, 2, 1)
                            : Colors.white,
                      ),
                      SizedBox(width: 30.w),
                      Expanded(
                        child: Text(
                          categoryController.leftData[index].title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight:
                                categoryController.currentIndex.value == index
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
