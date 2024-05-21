import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_consts.dart';
import 'package:smart_soft/core/config/app_images.dart';
import 'package:smart_soft/core/views/widgets/custom_network_image.dart';
import 'package:smart_soft/core/views/widgets/space.dart';

import '../../../../core/config/app_theme.dart';
import '../utils/design_model.dart';

class ClothDesignItem extends StatelessWidget {
  DesignModel designModel;

  ClothDesignItem({super.key, required this.designModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: .7.h),
      margin: EdgeInsets.only(bottom: 1.h),
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppTheme.neutral100,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(
            designModel.name,
            style: AppTheme.mainTextStyle(
                color: AppTheme.neutral900, fontSize: 11.sp),
          ),

          Row(
            children: [
              Text(
                designModel.type,
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral900, fontSize: 11.sp),
              ),

              Space(width: 3.w,),

              CustomNetworkImage(
                  height: 3.h,
                  width: 3.h,
                  url: AppConsts.imgUrl + designModel.image,
              ),
            ],
          )





        ],
      ),
    );
  }
}
