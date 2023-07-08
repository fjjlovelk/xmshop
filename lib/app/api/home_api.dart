import 'package:xmshop/app/utils/http_util.dart';

final HttpUtil httpUtil = HttpUtil();

Future getSwiperApi() async {
  final res = await httpUtil.dio.get('/meal1');
  return res.data;
}
