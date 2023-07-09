import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/api/home_api.dart';
import 'package:xmshop/app/models/category_model.dart';
import 'package:xmshop/app/models/home_swiper_model.dart';

class HomeController extends GetxController {
  RxBool showAppBarBackground = false.obs;
  ScrollController scrollController = ScrollController();

  RxList<HomeSwiperModel> swiperList = <HomeSwiperModel>[].obs;
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    scrollListener();
    getSwiperData();
    getCategoryData();
  }

  /// 监听listView滚动条
  void scrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels < 10 && showAppBarBackground.value) {
        showAppBarBackground.value = false;
        return;
      }
      if (scrollController.position.pixels >= 10 &&
          scrollController.position.pixels < 20 &&
          !showAppBarBackground.value) {
        showAppBarBackground.value = true;
        return;
      }
    });
  }

  /// 获取轮播图数据
  void getSwiperData() async {
    final response = await getSwiperApi();
    swiperList.value = response;
  }

  /// 获取分类数据
  void getCategoryData() async {
    final response = await getCategoryApi();
    categoryList.value = response;
  }
}
