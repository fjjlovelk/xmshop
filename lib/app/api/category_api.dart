import 'package:xmshop/app/models/category_model.dart';
import 'package:xmshop/app/utils/http_util.dart';

final HttpUtil httpUtil = HttpUtil();

/// 获取分类列表数据
Future<List<CategoryModel>> getCategoryListApi(
    {Map<String, dynamic>? params}) async {
  final response = await httpUtil.dio.get('/pcate', queryParameters: params);
  final List<CategoryModel> result = [];
  final json = response.data['result'];
  if (json != null && json is List) {
    for (var v in json) {
      result.add(CategoryModel.fromJson(v));
    }
  }
  return result;
}
