import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool showAppBarBackground = false.obs;
  ScrollController scrollController = ScrollController();

  List<Map<String, String>> swiperList = [
    {
      "url":
          'https://img.zcool.cn/community/01873d5d91f4b2a8012060be4c8e14.jpg@1280w_1l_2o_100sh.jpg'
    },
    {"url": 'https://pic1.zhimg.com/v2-cb64e170a495f64feee940782c89b320_r.jpg'},
    {
      "url":
          'https://ts1.cn.mm.bing.net/th/id/R-C.e38c583322d584f8efd633dda5a9b84d?rik=AlVaXp%2bQ7RNWdQ&riu=http%3a%2f%2fimg95.699pic.com%2fphoto%2f50072%2f9978.jpg_wh860.jpg&ehk=mfAeIZNTuyufMPCvcMx594kmw9BUCUdRXo%2fG51X3iBc%3d&risl=&pid=ImgRaw&r=0'
    },
  ];

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
}
