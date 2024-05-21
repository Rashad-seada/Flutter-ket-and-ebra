import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/views/widgets/space.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_network_image.dart';

class EmbroideryCard extends StatelessWidget {
  String title;
  String imgUrl;
  num price;
  void Function()? onTap;
  EmbroideryCard({super.key,required this.title,required this.imgUrl,required this.price, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(2.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.only(bottom: 2.h,),
        width: double.infinity,
        height: 10.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2.w),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(4, 4), // changes position of shadow
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              title,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral900, fontSize: 10.sp),
            ),

            CustomNetworkImage(
              width: 15.w,
              height: 15.w,
              url: imgUrl,
            ),

            Text(
              LocaleKeys.price,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral600, fontSize: 10.sp),
            ).tr(),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  "SAR",
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral900, fontSize: 10.sp),
                ),

                Space(width: 1.w,),

                Text(
                  price.toString(),
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.primary900, fontSize: 14.sp),
                ),

              ],
            )

          ],
        ),
      ),
    );
  }
}
