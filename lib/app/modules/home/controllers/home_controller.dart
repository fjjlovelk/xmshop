import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool showAppBarBackground = false.obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
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

  @override
  void onClose() {
    super.onClose();
  }
}
