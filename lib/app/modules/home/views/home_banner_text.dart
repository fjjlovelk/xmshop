import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBannerText extends StatelessWidget {
  const HomeBannerText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 35.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildRow('官方商城'),
          _buildRow('售后无忧'),
          _buildRow('资质证照'),
        ],
      ),
    );
  }

  Widget _buildRow(String text) {
    return Row(
      children: [
        const Icon(
          Icons.check_circle_outline,
          color: Color.fromRGBO(192, 192, 192, 0.5),
          size: 18,
        ),
        Text(
          text,
          style: TextStyle(
            color: const Color.fromRGBO(135, 135, 135, 1),
            fontSize: 32.sp,
          ),
        ),
      ],
    );
  }
}
