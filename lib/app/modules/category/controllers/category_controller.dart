import 'package:get/get.dart';
import 'package:xmshop/app/api/category_api.dart';
import 'package:xmshop/app/models/category_model.dart';

class CategoryController extends GetxController {
  final currentIndex = 0.obs;
  final RxList<CategoryModel> leftData = <CategoryModel>[].obs;
  final RxList<CategoryModel> rightData = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getLeftData();
  }

  /// 改变currentIndex
  void changeCurrentIndex(int index, String pid) {
    currentIndex.value = index;
    getRightData(pid);
  }

  /// 获取左侧分类数据
  void getLeftData() async {
    final response = await getCategoryListApi();
    leftData.value = response;
    if (response.isNotEmpty) {
      getRightData(response[0].id);
    }
  }

  /// 获取右侧分类数据
  void getRightData(String pid) async {
    try {
      final response = await getCategoryListApi(params: {"pid": pid});
      rightData.value = response;
    } catch (error) {
      print(error);
    }
  }
}
