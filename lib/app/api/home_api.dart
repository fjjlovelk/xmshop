import 'package:xmshop/app/models/category_model.dart';
import 'package:xmshop/app/models/goods_model.dart';
import 'package:xmshop/app/models/home_swiper_model.dart';
import 'package:xmshop/app/utils/http_util.dart';

final HttpUtil httpUtil = HttpUtil();

/// 获取首页轮播图数据
Future<List<HomeSwiperModel>> getSwiperApi(
    {Map<String, dynamic>? params}) async {
  final response = await httpUtil.dio.get('/focus', queryParameters: params);
  final List<HomeSwiperModel> result = [];
  final json = response.data['result'];
  if (json != null && json is List) {
    for (var v in json) {
      result.add(HomeSwiperModel.fromJson(v));
    }
  }
  return result;
}

/// 获取分类数据
Future<List<CategoryModel>> getCategoryApi() async {
  final response = await httpUtil.dio.get('/bestCate');
  final List<CategoryModel> result = [];
  final json = response.data['result'];
  if (json != null && json is List) {
    for (var v in json) {
      result.add(CategoryModel.fromJson(v));
    }
  }
  return result;
}

/// 获取商品数据
Future<List<GoodsModel>> getGoodsListApi({Map<String, dynamic>? params}) async {
  final response = await httpUtil.dio.get('/plist', queryParameters: params);
  final List<GoodsModel> result = [];
  final json = response.data['result'];
  if (json != null && json is List) {
    for (var v in json) {
      result.add(GoodsModel.fromJson(v));
    }
  }
  return result;
}
