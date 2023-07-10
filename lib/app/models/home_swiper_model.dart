// To parse this JSON data, do
//
//     final homeSwiperModel = homeSwiperModelFromJson(jsonString);

import 'dart:convert';

import 'package:xmshop/app/config/http_config.dart';

class HomeSwiperModel {
  String id;
  String title;
  String status;
  String pic;
  String picUrl;
  String url;
  int position;

  HomeSwiperModel({
    required this.id,
    required this.title,
    required this.status,
    required this.pic,
    required this.picUrl,
    required this.url,
    required this.position,
  });

  factory HomeSwiperModel.fromRawJson(String str) =>
      HomeSwiperModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeSwiperModel.fromJson(Map<String, dynamic> json) {
    String newUrl = json["pic"] ?? '';
    return HomeSwiperModel(
      id: json["_id"],
      title: json["title"],
      status: json["status"],
      pic: newUrl,
      picUrl: '${HttpConfig.url}/${newUrl.replaceAll('\\', '/')}',
      url: json["url"],
      position: json["position"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "status": status,
        "pic": pic,
        "pic_url": picUrl,
        "url": url,
        "position": position,
      };
}
