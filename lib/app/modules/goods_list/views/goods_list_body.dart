import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:xmshop/app/models/goods_model.dart';
import 'package:xmshop/app/modules/goods_list/controllers/goods_list_controller.dart';

class GoodsListBody extends StatelessWidget {
  final GoodsListController goodsListController =
      Get.find<GoodsListController>();
  GoodsListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color.fromRGBO(244, 244, 244, 1),
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: RefreshIndicator(
          onRefresh: () => Future.sync(
            () => goodsListController.pagingController.refresh(),
          ),
          child: PagedListView<int, GoodsModel>(
            pagingController: goodsListController.pagingController,
            scrollController: goodsListController.scrollController,
            builderDelegate: PagedChildBuilderDelegate<GoodsModel>(
              animateTransitions: true,
              itemBuilder: (context, item, index) => GoodsListItem(
                url: item.sPicUrl,
                title: item.title,
                price: item.price,
                hasTop: index == 0,
              ),
              noMoreItemsIndicatorBuilder: (_) => const Center(
                child: Text("没有更多了"),
              ),
              noItemsFoundIndicatorBuilder: (_) => const Center(
                child: Text("没有更多了"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GoodsListItem extends StatelessWidget {
  final String url;
  final String title;
  final int price;
  final bool hasTop;
  const GoodsListItem(
      {Key? key,
      required this.url,
      required this.title,
      required this.price,
      required this.hasTop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
      ),
      margin: EdgeInsets.fromLTRB(0, hasTop ? 25.h : 0, 0, 25.h),
      padding: EdgeInsets.fromLTRB(70.w, 60.h, 65.w, 60.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.memoryNetwork(
            width: 310.w,
            height: 310.w,
            placeholder: kTransparentImage,
            image: url,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(width: 90.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text('￥$price'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
