import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';
import 'package:smart_soft/core/views/widgets/space.dart';

import '../../../../core/views/widgets/custom_network_image.dart';
import '../../../../core/views/widgets/custom_rating_bar.dart';

class TailorCard extends StatelessWidget {
  String name;
  String imgUrl;
  double rating;
  void Function()? onTap;
  TailorCard({super.key,required this.name, required this.imgUrl , required this.rating,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(2.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.only(bottom: 2.h,left: 7.w,right: 7.w),
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
          ]
        ),
        child: Row(
          children: [

            Container(
              width: 13.w,
              height: 13.w,
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.only(right: 2.w),
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
                  ]
              ),
              child: CustomNetworkImage(
                width: 38.w,
                height: double.infinity,
                fit: BoxFit.cover,
                url: imgUrl,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(2.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: AppTheme.mainTextStyle(
                            color: AppTheme.neutral900, fontSize: 12.sp),
                      ),

                    ],
                  ),

                  Space(height: 2.w,),

                  CustomRatingBar(initialRating: rating,)

                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}
