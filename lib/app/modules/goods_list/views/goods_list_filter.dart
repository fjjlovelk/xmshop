import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/goods_list/controllers/goods_list_controller.dart';

class GoodsListFilter extends StatelessWidget {
  final GoodsListController goodsListController =
      Get.find<GoodsListController>();
  GoodsListFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150.h,
      child: Row(
        children: goodsListController.filterList
            .asMap()
            .keys
            .map((index) => FilterItemWidget(index: index))
            .toList(),
      ),
    );
  }
}

class FilterItemWidget extends StatelessWidget {
  final GoodsListController goodsListController =
      Get.find<GoodsListController>();
  final int index;
  FilterItemWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build-------------');
    return Expanded(
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                goodsListController.filterList[index].name,
                style: TextStyle(
                  color: goodsListController.currentFilterIndex.value == index
                      ? Colors.red
                      : Colors.black45,
                ),
              ),
            ),
            Obx(
              () => Icon(
                goodsListController.filterList[index].isSort
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down,
                size: 14,
                color: goodsListController.currentFilterIndex.value == index
                    ? Colors.red
                    : Colors.black45,
              ),
            ),
          ],
        ),
        onTap: () {
          goodsListController.setCurrentIndex(index);
        },
      ),
    );
  }
}
