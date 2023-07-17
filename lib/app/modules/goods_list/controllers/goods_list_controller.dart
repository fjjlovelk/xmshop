import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:xmshop/app/api/home_api.dart';
import 'package:xmshop/app/models/goods_model.dart';

class FilterItem {
  final String code;
  final String name;
  bool isSort;

  FilterItem({
    required this.code,
    required this.name,
    this.isSort = false,
  });
}

class GoodsListController extends GetxController {
  final String cid;
  static const _pageSize = 8;
  final PagingController<int, GoodsModel> pagingController =
      PagingController(firstPageKey: 1, invisibleItemsThreshold: 1);
  final ScrollController scrollController = ScrollController();

  final RxList<FilterItem> filterList = <FilterItem>[
    FilterItem(code: "all", name: "综合"),
    FilterItem(code: "salecount", name: "销量"),
    FilterItem(code: "price", name: "价格"),
    FilterItem(code: "filter", name: "筛选"),
  ].obs;

  final currentFilterIndex = 0.obs;

  GoodsListController({required this.cid});

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      getGoodsData(pageKey);
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    pagingController.dispose();
    super.onClose();
  }

  /// 获取商品数据
  Future<void> getGoodsData(int page) async {
    try {
      final filter = filterList[currentFilterIndex.value];
      final sortParams = '${filter.code}_${filter.isSort ? 1 : -1}';
      final newItems = await getGoodsListApi(params: {
        "cid": cid,
        "page": page,
        "pageSize": _pageSize,
        "sort": sortParams,
      });
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = page + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  /// 设置当前filter索引
  void setCurrentIndex(int index) {
    if (currentFilterIndex.value == index) {
      filterList[index] = FilterItem(
        code: filterList[index].code,
        name: filterList[index].name,
        isSort: !filterList[index].isSort,
      );
    } else {
      currentFilterIndex.value = index;
    }
    pagingController.refresh();
    scrollController.jumpTo(0);
  }
}
