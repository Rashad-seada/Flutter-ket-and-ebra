import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/cart/views/blocs/cart/cart_cubit.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';

class CartNavBar extends StatelessWidget {
  void Function()? onCheckoutClick;
  void Function()? onContinueShoppingClick;
  bool showContinueButton;
  bool isCheckoutActive;
  CartNavBar({super.key,this.showContinueButton = false,this.onCheckoutClick,this.onContinueShoppingClick,this.isCheckoutActive = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 2.h),
      alignment: Alignment.center,
      clipBehavior: Clip.hardEdge,

      width: double.infinity,
      height: (showContinueButton)? 18.h : 10.h,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Row(
                children: [
                  Text(
                    LocaleKeys.total+":",
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.primary900, fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
                  ),
                  Space(width: 2.w,),

                  Text(
                    (CartSuccess.cartResponse?.obj?.price ?? 00).toString(),
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.neutral900, fontSize: 14.sp),
                  ),
                  Space(width: 1.w,),


                  Text(
                    "SAR",
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.neutral900, fontSize: 11.sp),
                  ),
                ],
              ),


              MainButton(
                color: isCheckoutActive ? AppTheme.primary900 : AppTheme.neutral200,
                width: 30.w,
                height: 5.5.h,
                label: Text(
                  LocaleKeys.check_out,
                  style: AppTheme.mainTextStyle(
                      color: isCheckoutActive ? AppTheme.neutral100 : AppTheme.neutral500, fontSize: 11.sp),
                ).tr(),
                onTap: isCheckoutActive ? onCheckoutClick : null,
              ),
            ],
          ),

          (showContinueButton)?
          Space(height: 2.h,): SizedBox(),

          (showContinueButton)?
          MainButton(
            border: Border.all(color: AppTheme.primary900),
            color: Colors.transparent,
            width: 86.w,
            height: 5.5.h,
            label: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SvgPicture.asset(
                  AppImages.cart,
                  width: 5.w,
                  height: 5.w,
                  color: AppTheme.primary900,
                ),

                Space(width:3.w,),
                Text(
                  LocaleKeys.continue_shopping,
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.primary900, fontSize: 10.sp),
                ).tr(),
              ],
            ),
            onTap: onContinueShoppingClick,
          ) : SizedBox(),
        ],
      ),
    );
  }
}
