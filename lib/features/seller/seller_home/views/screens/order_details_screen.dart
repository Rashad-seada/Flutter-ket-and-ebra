import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/config/app_images.dart';
import '../../../../../core/views/widgets/custom_header.dart';
import '../../../../../core/views/widgets/space.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../variation/views/components/cloth_design_card.dart';
import '../../../../variation/views/components/cloth_size_card.dart';
import '../../data/entities/get_seller_orders_reponse.dart';
import '../blocs/seller_home/seller_home_cubit.dart';
import '../components/user_info_card.dart';


class OrderDetailsScreen extends StatelessWidget {
  SellerOrder sellerOrder;
  OrderDetailsScreen({super.key,required this.sellerOrder});

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

            CustomHeader(title: LocaleKeys.cloth_details.tr(),showCart: false,),

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

            UserInfoCard(designModels: context.read<SellerHomeCubit>().userModels(sellerOrder),),

            Space(
              height: 2.h,
            ),

            ClothDesignCard(designModels: context.read<SellerHomeCubit>().designModels(sellerOrder),),

            Space(
              height: 2.h,
            ),

            ClothSizeCard(sizeModels: context.read<SellerHomeCubit>().sizeModels(sellerOrder),),

            Space(
              height: 5.h,
            ),

          ],
        ),
      ),

    ));
  }
}
