import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/cart/views/components/quantity_component.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/space.dart';

class CartCard extends StatelessWidget {
  double price;
  String fabric;
  CartCard({super.key,required this.price,required this.fabric});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      alignment: Alignment.center,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.only(
        bottom: 2.h,
      ),
      width: double.infinity,
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
              flex: 3,

              child: SvgPicture.asset(
                fit: BoxFit.fitWidth,
                AppImages.cloth,
                width: 50.w,
                height: 13.h,
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
                      children: [
                        Text(
                          "${LocaleKeys.fabric.tr()}:",
                          style: AppTheme.mainTextStyle(
                              color: AppTheme.neutral900, fontSize: 13.sp),
                        ),

                        Space(width: 3.w,),
                        Text(
                          fabric,
                          style: AppTheme.mainTextStyle(
                              color: AppTheme.neutral600, fontSize: 10.sp),
                        ),
                      ],
                    ),
                    Space(height: 1.w,),

                    Row(
                      children: [
                        Text(
                          "${LocaleKeys.quantity.tr()}:",
                          style: AppTheme.mainTextStyle(
                              color: AppTheme.neutral900, fontSize: 13.sp),
                        ),

                        Space(width: 3.w,),
                        QuantityComponent()
                      ],
                    ),
                    Space(height: 1.w,),

                    Row(
                      children: [
                        Text(
                          "${LocaleKeys.price.tr()}:",
                          style: AppTheme.mainTextStyle(
                              color: AppTheme.neutral900, fontSize: 13.sp),
                        ),

                        Space(width: 3.w,),
                        Text(
                          price.toString(),
                          style: AppTheme.mainTextStyle(
                              color: AppTheme.primary900, fontSize: 14.sp),
                        ),
                        Space(width: 1.w,),
                        Text(
                          "SAR",
                          style: AppTheme.mainTextStyle(
                              color: AppTheme.neutral900, fontSize: 11.sp),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        InkWell(
                          borderRadius: BorderRadius.circular(100.w),
                          onTap: () {

                          },
                          child: SvgPicture.asset(
                            AppImages.trash,
                            width: 7.w,
                            height: 7.w,
                          ),
                        ),

                      ],
                    )

                  ],
                ),
              )
          ),

        ],
      ),
    );
  }
}


