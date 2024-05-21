import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/cart/views/components/quantity_component.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';

import '../../../../../core/config/app_images.dart';
import '../../../../../core/config/app_theme.dart';
import '../../../../../core/views/widgets/space.dart';
import '../../data/entities/get_seller_orders_reponse.dart';
import '../screens/order_details_screen.dart';


class OrderCard extends StatelessWidget {
  SellerOrder sellerOrder;
  OrderCard({super.key,required this.sellerOrder});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (_)=> OrderDetailsScreen(sellerOrder: sellerOrder,))),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.only(
          bottom: 2.h,
        ),
        width: double.infinity,
        height: 14.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2.w),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(4, 4), // changes position of shadow
              ),
            ]),
      
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      
            Expanded(
              flex: 2,
      
              child: SvgPicture.asset(
                fit: BoxFit.fitWidth,
                AppImages.cloth,
                width: 20.w,
                height: 35.h,
              ),
            ),
      
            Expanded(
              flex: 4,
      
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
      
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          sellerOrder.userName ?? "",
                          style: AppTheme.mainTextStyle(
                              color: AppTheme.neutral900, fontSize: 13.sp),
                        ),
      
                        Container(
                          padding: EdgeInsets.all(1.w),
                          alignment: Alignment.center,
                          clipBehavior: Clip.hardEdge,
      
                          width: 7.w,
                          height: 7.w,
                          decoration: BoxDecoration(
                              color: AppTheme.primary900,
                              borderRadius: BorderRadius.circular(100.w),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(4, 4), // changes position of shadow
                                ),
                              ]),
                          child: SvgPicture.asset(
                            fit: BoxFit.fitWidth,
                            AppImages.phone,
                            width: 5.w,
                            height: 5.w,
                            color: AppTheme.neutral100,
                          ),
                        )
                      ],
                    ),
                    Space(height: 1.w,),
      
                    Row(
                      children: [
                        Text(
                          "${LocaleKeys.cloth_details.tr()}",
                          style: AppTheme.mainTextStyle(
                              color: AppTheme.neutral900, fontSize: 13.sp),
                        ),
                        Space(width: 1.w,),
      
      
                        SvgPicture.asset(
                          fit: BoxFit.fitWidth,
                          AppImages.rightArrow,
                          width: 2.w,
                          height: 2.h,
                        ),
                      ],
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


