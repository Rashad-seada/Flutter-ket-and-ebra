import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_images.dart';
import 'package:smart_soft/core/views/widgets/space.dart';
import 'package:smart_soft/features/admin/admin_home/data/entities/get_admin_home_response.dart';

import '../../../../../core/config/app_theme.dart';
import '../screens/seller_details_screen.dart';

class PendingSellerCard extends StatelessWidget {

  void Function()? onTap;
  ReturnListofReq seller;

  PendingSellerCard({super.key,required this.seller,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> SellerDetailsScreen(seller: seller,))),
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(bottom: 2.h),
          padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
          decoration: BoxDecoration(
            color: AppTheme.green,
            borderRadius: BorderRadius.circular(4.w),
            boxShadow: [

            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [
                      SvgPicture.asset(AppImages.profile,width: 8.w,height: 8.w,color: AppTheme.neutral100,),

                      Space(width: 2.w,),

                      Text(
                        seller.name.toString(),
                        style: AppTheme.mainTextStyle(
                            color: AppTheme.neutral100, fontSize: 14.sp),
                      ),
                    ],
                  ),



                  Icon(Icons.arrow_forward_ios,color: AppTheme.neutral100,),

                ],
              ),
              Space(height: 1.h,),

              Text(
                "+${seller.phoneNumber}",
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral100, fontSize: 16.sp,fontWeight: FontWeight.w700),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
