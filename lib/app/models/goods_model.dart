// To parse this JSON data, do
//
//     final goodsModel = goodsModelFromJson(jsonString);

import 'dart:convert';

import 'package:xmshop/app/config/http_config.dart';

class GoodsModel {
  String id;
  String title;
  String cid;
  int price;
  String pic;
  String picUrl;
  String subTitle;
  String sPic;
  String sPicUrl;

  GoodsModel({
    required this.id,
    required this.title,
    required this.cid,
    required this.price,
    required this.pic,
    required this.picUrl,
    required this.subTitle,
    required this.sPic,
    required this.sPicUrl,
  });

  factory GoodsModel.fromRawJson(String str) =>
      GoodsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GoodsModel.fromJson(Map<String, dynamic> json) {
    String newPicUrl = json["pic"] ?? '';
    String newSPicUrl = json["s_pic"] ?? '';
    return GoodsModel(
      id: json["_id"],
      title: json["title"],
      cid: json["cid"],
      price: json["price"],
      pic: json["pic"],
      picUrl: '${HttpConfig.url}/${newPicUrl.replaceAll('\\', '/')}',
      subTitle: json["sub_title"],
      sPic: json["s_pic"],
      sPicUrl: '${HttpConfig.url}/${newSPicUrl.replaceAll('\\', '/')}',
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "cid": cid,
        "price": price,
        "pic": pic,
        "pic_url": picUrl,
        "sub_title": subTitle,
        "s_pic": sPic,
        "s_pic_url": sPicUrl,
      };
}
