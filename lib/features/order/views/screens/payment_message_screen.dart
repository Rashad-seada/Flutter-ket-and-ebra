import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../blocs/orders/order_cubit.dart';

class PaymentMessageScreen extends StatelessWidget {
  const PaymentMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: ListView(
          shrinkWrap: true,
          children: [

            Space(
              height: 20.h,
            ),

            Image.asset(
              AppImages.done,
              width: 30.w,
              height: 30.w,
            ),

            Space(
              height: 5.h,
            ),

            Center(
              child: Text(
                textAlign: TextAlign.center,
                LocaleKeys.payment_message_title,
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral900, fontSize: 18.sp),
              ).tr(),
            ),

            Space(
              height: 3.h,
            ),

            Center(
              child: Text(
                LocaleKeys.payment_message_sub_title,
                textAlign: TextAlign.center,
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral500,
                    fontSize: 14.sp,
                ),
              ).tr(),
            ),

            Space(
              height: 6.h,
            ),

            MainButton(
              color: AppTheme.primary900,
              width: 86.w,
              height: 6.5.h,
              label:  Text(
                LocaleKeys.done,
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral100, fontSize: 10.sp),
              ).tr(),
              onTap: ()=> context.read<OrderCubit>().onPaymentMessageDoneClick(context),
            ),


          ],
        ),
      ),
    ));
  }
}
