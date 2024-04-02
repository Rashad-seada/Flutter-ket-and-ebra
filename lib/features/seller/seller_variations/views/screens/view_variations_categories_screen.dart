import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';

import '../../../../../core/views/widgets/custom_header.dart';
import '../../../../../core/views/widgets/space.dart';
import '../blocs/seller_variations/seller_variations_cubit.dart';
import '../components/seller_variants_category_item.dart';
import '../utils/variations_enum.dart';

class ViewVariationCategoriesScreen extends StatelessWidget {
  const ViewVariationCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Space(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.5.w),
            child: CustomHeader(
              title: "View Variants",
              showCart: false,
            ),
          ),
          Space(
            height: 3.h,
          ),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            shrinkWrap: true,
            children: [
              SellerVariantsCategoryItem(
                label: LocaleKeys.fabric.tr(),
                onTap: ()=> context.read<SellerVariationsCubit>().onSellerVariationsTap(context, variationsEnum: VariationsEnum.Fabric),
              ),

              SellerVariantsCategoryItem(
                label: LocaleKeys.collar.tr(),
                onTap: ()=> context.read<SellerVariationsCubit>().onSellerVariationsTap(context, variationsEnum: VariationsEnum.Collar),

              ),
              SellerVariantsCategoryItem(
                label: LocaleKeys.front_pocket.tr(),
                onTap: ()=> context.read<SellerVariationsCubit>().onSellerVariationsTap(context, variationsEnum: VariationsEnum.FrontPocket),

              ),
              SellerVariantsCategoryItem(
                label: LocaleKeys.chest.tr(),
                onTap: ()=> context.read<SellerVariationsCubit>().onSellerVariationsTap(context, variationsEnum: VariationsEnum.Chest),

              ),
              SellerVariantsCategoryItem(
                label: LocaleKeys.sleeve.tr(),
                onTap: ()=> context.read<SellerVariationsCubit>().onSellerVariationsTap(context, variationsEnum: VariationsEnum.Sleeve),

              ),
              SellerVariantsCategoryItem(
                label: LocaleKeys.button.tr(),
                onTap: ()=> context.read<SellerVariationsCubit>().onSellerVariationsTap(context, variationsEnum: VariationsEnum.Button),

              ),
              SellerVariantsCategoryItem(
                label: LocaleKeys.embroidery.tr(),
                onTap: ()=> context.read<SellerVariationsCubit>().onSellerVariationsTap(context, variationsEnum: VariationsEnum.Embroidery),


              ),
            ],
          )
        ],
      ),
    ));
  }
}
