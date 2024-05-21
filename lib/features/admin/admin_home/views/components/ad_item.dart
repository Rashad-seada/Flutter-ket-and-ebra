import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_consts.dart';
import 'package:smart_soft/core/views/widgets/space.dart';
import 'package:smart_soft/features/admin/admin_home/data/entities/get_home_ads_by_admin_response.dart';

import '../../../../../core/config/app_theme.dart';
import '../../../../../core/views/widgets/custom_network_image.dart';

class AdItemItem extends StatelessWidget {
  void Function()? onTap;
  void Function()? onDelete;
  Obj sellerVariationModel;
  AdItemItem({super.key,this.onTap,this.onDelete, required this.sellerVariationModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(2.w),
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h,left: 7.w,right: 7.w),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            CustomNetworkImage(
              width: 20.w,
              height: 20.w,
              fit: BoxFit.fitHeight,
              url: AppConsts.imgUrl + (sellerVariationModel.imgUrl ?? ""),
            ),

            Space(width: 5.w,),

            Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 57.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,

                    children: [
                      Expanded(
                        child: Text(
                          (sellerVariationModel.description ?? ""),
                          style: AppTheme.mainTextStyle(
                              color: AppTheme.neutral900, fontSize: 12.sp),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      InkWell(
                        onTap: onDelete,
                        child: Icon(
                          Icons.delete_outline_rounded,
                          size: 5.w,
                        ),
                      ),
                    ],
                  ),
                ),


              ],
            ),






          ],
        ),
      ),
    );
  }
}
