import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';
import 'package:smart_soft/core/views/widgets/space.dart';

import '../../../../core/views/widgets/custom_network_image.dart';

class FabricCard extends StatelessWidget {
  String imgUrl;
  String name;
  String description;
  num price;
  void Function()? onTap;
  FabricCard({super.key,required this.imgUrl ,required this.name,required this.description,required this.price, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.only(bottom: 2.h,left: 7.w,right: 7.w),
        width: double.infinity,
        height: 17.h,
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

            Expanded(
              flex: 3,
              child: CustomNetworkImage(
                width: 38.w,
                height: double.infinity,
                fit: BoxFit.cover,
                url: imgUrl,
              ),
            ),

            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(2.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      name,
                      style: AppTheme.mainTextStyle(
                          color: AppTheme.neutral900, fontSize: 12.sp),
                    ),

                    Space(height: 2.w,),


                    Row(
                      children: [
                        Text(
                          price.toString(),
                          style: AppTheme.mainTextStyle(
                              color: AppTheme.primary900, fontSize: 11.sp),
                        ),

                        Space(width: 1.w,),
                        Text(
                          "SAR",
                          style: AppTheme.mainTextStyle(
                              color: AppTheme.neutral900, fontSize: 11.sp),
                        ),
                      ],
                    ),

                    Space(height: 3.w,),

                    Text(
                      description,
                      style: AppTheme.mainTextStyle(
                          color: AppTheme.neutral700, fontSize: 10.sp),
                      maxLines: 2,
                    ),


                  ],
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
