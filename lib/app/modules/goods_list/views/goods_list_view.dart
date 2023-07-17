import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/goods_list/views/goods_list_body.dart';
import 'package:xmshop/app/modules/goods_list/views/goods_list_filter.dart';

import '../controllers/goods_list_controller.dart';

class GoodsListView extends GetView<GoodsListController> {
  const GoodsListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GoodsListView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GoodsListFilter(),
          GoodsListBody(),
        ],
      ),
    );
  }
}
