// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

import 'package:xmshop/app/config/http_config.dart';

class CategoryModel {
  String id;
  String title;
  int status;
  String pic;
  String picUrl;
  String pid;
  int sort;
  int isBest;
  int goProduct;
  String productId;

  CategoryModel({
    required this.id,
    required this.title,
    required this.status,
    required this.pic,
    required this.picUrl,
    required this.pid,
    required this.sort,
    required this.isBest,
    required this.goProduct,
    required this.productId,
  });

  factory CategoryModel.fromRawJson(String str) =>
      CategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    String newUrl = json["pic"] ?? '';
    return CategoryModel(
      id: json["_id"],
      title: json["title"],
      status: json["status"],
      pic: json["pic"],
      picUrl: '${HttpConfig.url}/${newUrl.replaceAll('\\', '/')}',
      pid: json["pid"],
      sort: json["sort"],
      isBest: json["is_best"],
      goProduct: json["go_product"],
      productId: json["product_id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "status": status,
        "pic": pic,
        "picUrl": picUrl,
        "pid": pid,
        "sort": sort,
        "is_best": isBest,
        "go_product": goProduct,
        "product_id": productId,
      };
}
