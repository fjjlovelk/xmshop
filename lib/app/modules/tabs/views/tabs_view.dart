import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.currentPage,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12.0,
          enableFeedback: false,
          onTap: (index) {
            controller.setCurrentIndex(index);
          },
          items: controller.bottomNavigationBarItems,
        ),
      ),
    );
  }
}
