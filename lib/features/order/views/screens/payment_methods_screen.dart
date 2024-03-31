import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_header.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../blocs/orders/order_cubit.dart';
import '../components/payment_methods_component.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

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
              height: 2.h ,
            ),

            CustomHeader(title: LocaleKeys.payment_methods.tr(),showCart: false,),

            Space(
              height: 3.h,
            ),

            PaymentMethodsComponent(title: LocaleKeys.visa.tr(), value: '1', groupValue: '11',onChanged: (value){},),

            PaymentMethodsComponent(title: LocaleKeys.cash.tr(), value: '11', groupValue: '11',onChanged: (value){},),

            Space(
              height: 5.h,
            ),

            MainButton(
              color: AppTheme.primary900,
              width: 86.w,
              height: 6.5.h,
              label:  Text(
                LocaleKeys.confirm,
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral100, fontSize: 13.sp),
              ).tr(),
              onTap: ()=> context.read<OrderCubit>().onPaymentConfirmClick(context),
            ),


          ],
        ),
      ),
    ));
  }
}
