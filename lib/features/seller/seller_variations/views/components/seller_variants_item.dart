import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/config/app_theme.dart';
import '../utils/seller_variation_model.dart';

class SellerVariantsItem extends StatelessWidget {
  SellerVariationModel sellerVariationModel;
  void Function()? onTap;

  SellerVariantsItem({super.key,required this.sellerVariationModel,this.onTap,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(2.w),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 3.h,horizontal: 3.w),
        margin: EdgeInsets.only(bottom: 2.h),
        clipBehavior: Clip.hardEdge,
        width: double.infinity,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              sellerVariationModel.name,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral900, fontSize: 12.sp),
            ),

            Icon(
              Icons.delete_outline_rounded,
              size: 5.w,
            ),

          ],
        ),
      ),
    );
  }
}
