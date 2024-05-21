import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/config/app_images.dart';
import '../../../../../core/views/widgets/custom_header.dart';
import '../../../../../core/views/widgets/space.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../cart/views/blocs/cart/cart_cubit.dart';
import '../../../seller/seller_home/data/entities/get_seller_orders_reponse.dart';
import '../../../seller/seller_home/views/blocs/seller_home/seller_home_cubit.dart';
import '../../../variation/views/components/cloth_design_card.dart';
import '../../../variation/views/components/cloth_size_card.dart';


class OrderItemDetailsScreen extends StatelessWidget {
  SellerOrder sellerOrder;
  OrderItemDetailsScreen({super.key,required this.sellerOrder});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.5.w),
        child: ListView(
          shrinkWrap: true,

          children: [

            Space(
              height: 2.h ,
            ),

            CustomHeader(title: LocaleKeys.cart.tr(),showCart: false,),

            Space(
              height: 3.h,
            ),

            SvgPicture.asset(
              fit: BoxFit.fitWidth,
              AppImages.cloth,
              width: 100.w,
              height: 38.h,
            ),

            Space(
              height: 2.h,
            ),


            Space(
              height: 2.h,
            ),

            ClothDesignCard(designModels: context.read<CartCubit>().designModels(sellerOrder),),

            Space(
              height: 2.h,
            ),

            ClothSizeCard(sizeModels: context.read<CartCubit>().sizeModels(sellerOrder),),

            Space(
              height: 5.h,
            ),

          ],
        ),
      ),

    ));
  }
}
