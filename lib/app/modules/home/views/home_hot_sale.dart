import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xmshop/app/config/theme_config.dart';

class HomeHotSale extends StatelessWidget {
  const HomeHotSale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          _buildTitle(),
          Row(
            children: [
              _buildLeft(),
              SizedBox(width: 20.w),
              _buildRight(),
            ],
          )
        ],
      ),
    );
  }

  // 标题
  Widget _buildTitle() {
    return const ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text('热销甄选'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('更多手机推荐'),
          Icon(
            Icons.chevron_right,
            color: ThemeConfig.grey2,
          )
        ],
      ),
    );
  }

  // 左侧
  Widget _buildLeft() {
    return Container(
      width: 500.w,
      height: 735.h,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(248, 248, 248, 1),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Swiper(
        itemBuilder: (BuildContext context, int swiperIndex) {
          return Image.network(
              'https://xiaomi.itying.com/public/upload/HYWKHxrKgE9O6zKajRTmb50B.png');
        },
        itemCount: 3,
      ),
    );
  }

  // 右侧
  Widget _buildRight() {
    return Expanded(
      child: Column(
        children: [
          _buildRightItem(
            '空气炸烤箱',
            '大容量专业炸烤',
            '众筹价￥799',
            'https://xiaomi.itying.com/public/upload/HYWKHxrKgE9O6zKajRTmb50B.png',
          ),
          SizedBox(height: 20.h),
          _buildRightItem(
            'Note 11 5G',
            '至高优惠100元',
            '到手价￥1199起',
            'https://xiaomi.itying.com/public/upload/HYWKHxrKgE9O6zKajRTmb50B.png',
          ),
          SizedBox(height: 20.h),
          _buildRightItem(
            'Xiaomi 12s',
            '领券下单立减100元',
            '￥3899起',
            'https://xiaomi.itying.com/public/upload/HYWKHxrKgE9O6zKajRTmb50B.png',
          ),
        ],
      ),
    );
  }

  Widget _buildRightItem(
      String title, String subTitle, String description, String url) {
    return ListTile(
      minVerticalPadding: 20.h,
      contentPadding: EdgeInsets.fromLTRB(10.w, 0, 5.w, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      tileColor: const Color.fromRGBO(248, 248, 248, 1),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subTitle,
            style: TextStyle(
              color: const Color.fromRGBO(99, 99, 99, 1),
              fontSize: 30.sp,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            description,
            style: TextStyle(
              color: const Color.fromRGBO(99, 99, 99, 1),
              fontWeight: FontWeight.bold,
              fontSize: 30.sp,
            ),
          ),
        ],
      ),
      trailing: Image.network(url),
    );
  }
}
