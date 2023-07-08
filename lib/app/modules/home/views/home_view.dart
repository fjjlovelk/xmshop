import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/views/custom_app_bar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -(View.of(context).padding.top + 4).h,
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView.builder(
              controller: controller.scrollController,
              itemBuilder: (ctx, index) {
                if (index == 0) {
                  return SizedBox(
                    width: double.infinity,
                    height: 700.h,
                    child: Image.network(
                      'https://img.zcool.cn/community/01873d5d91f4b2a8012060be4c8e14.jpg@1280w_1l_2o_100sh.jpg',
                      fit: BoxFit.cover,
                    ),
                  );
                }
                return Text('data---$index');
              },
              itemCount: 200,
            ),
          ),
          CustomAppBar(),
        ],
      ),
    );
  }
}
