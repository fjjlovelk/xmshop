import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: controller.pages,
          onPageChanged: (index) => controller.setCurrentIndex(index),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12.0,
          enableFeedback: false,
          onTap: (index) {
            controller.pageController.jumpToPage(index);
            controller.setCurrentIndex(index);
          },
          items: controller.bottomNavigationBarItems,
        ),
      ),
    );
  }
}
