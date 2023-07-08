import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/cart/views/cart_view.dart';
import 'package:xmshop/app/modules/category/views/category_view.dart';
import 'package:xmshop/app/modules/give/views/give_view.dart';
import 'package:xmshop/app/modules/home/views/home_view.dart';
import 'package:xmshop/app/modules/user/views/user_view.dart';
import 'package:xmshop/app/utils/keep_alive_wrapper.dart';

class TabsController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 0);

  final List<Widget> pages = const [
    KeepAliveWrapper(child: HomeView()),
    KeepAliveWrapper(child: CategoryView()),
    KeepAliveWrapper(child: GiveView()),
    KeepAliveWrapper(child: CartView()),
    KeepAliveWrapper(child: UserView()),
  ];

  final List<BottomNavigationBarItem> bottomNavigationBarItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
    BottomNavigationBarItem(icon: Icon(Icons.room_service), label: '服务'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: '购物车'),
    BottomNavigationBarItem(icon: Icon(Icons.people), label: '用户'),
  ];

  Widget get currentPage => pages[currentIndex.value];

  void setCurrentIndex(int index) => currentIndex.value = index;
}
