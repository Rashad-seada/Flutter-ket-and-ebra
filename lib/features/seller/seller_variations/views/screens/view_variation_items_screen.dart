import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_images.dart';
import 'package:smart_soft/core/config/app_theme.dart';
import 'package:smart_soft/core/views/widgets/custom_progress_indicator.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';

import '../../../../../core/views/widgets/custom_header.dart';
import '../../../../../core/views/widgets/space.dart';
import '../blocs/seller_variations/seller_variations_cubit.dart';
import '../components/seller_variants_item.dart';
import '../utils/variations_enum.dart';

class ViewVariationItemsScreen extends StatefulWidget {
  VariationsEnum variationsEnum;

  ViewVariationItemsScreen({super.key,required this.variationsEnum});

  @override
  State<ViewVariationItemsScreen> createState() => _ViewVariationItemsScreenState();
}

class _ViewVariationItemsScreenState extends State<ViewVariationItemsScreen> {

  @override
  void initState() {
    context.read<SellerVariationsCubit>().getVariation(context, variationsEnum: widget.variationsEnum);
    super.initState();
  }

  String getLabel(){
    switch(widget.variationsEnum){
      case VariationsEnum.Fabric:
      return LocaleKeys.fabric.tr();

      case VariationsEnum.Collar:
        return LocaleKeys.collar.tr();

      case VariationsEnum.FrontPocket:
        return LocaleKeys.front_pocket.tr();

      case VariationsEnum.Chest:
        return LocaleKeys.chest.tr();

      case VariationsEnum.Sleeve:
        return LocaleKeys.sleeve.tr();

      case VariationsEnum.Button:
        return LocaleKeys.button.tr();

      case VariationsEnum.Embroidery:
        return LocaleKeys.embroidery.tr();

    };
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [

          Space(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.5.w),
            child: CustomHeader(
              title: getLabel(),
              showCart: false,
            ),
          ),
          Space(
            height: 3.h,
          ),
          
          BlocConsumer<SellerVariationsCubit,SellerVariationsState>(
            listener: (context, state) {},
            builder: (context, state) {

              if(state is SellerVariationsIsLoading){
                return CustomProgressIndicator();
              } else if(state is SellerVariationsError){
                return Text(SellerVariationsError.failure.message);

              } else if(state is SellerVariationsSuccess) {

                if(SellerVariationsSuccess.sellerVariationModels?.isEmpty ?? true){
                  return Column(
                    children: [


                      Space(height: 25.h,),

                      Image.asset( AppImages.empty,
                        fit: BoxFit.fitHeight,
                        width: 40.w,
                        height: 30.w,
                      ),

                      Space(height: 3.h,),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text(
                          LocaleKeys.empty_seller_item,
                          style: AppTheme.mainTextStyle(
                              color: AppTheme.neutral500, fontSize: 12.sp,),
                          textAlign: TextAlign.center,

                        ).tr(),
                      ),

                    ],
                  );
                }
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: SellerVariationsSuccess.sellerVariationModels?.length ?? 0,
                    itemBuilder: (context,index){
                      return SellerVariantsItem(sellerVariationModel: SellerVariationsSuccess.sellerVariationModels![index]);
                    });
              }

              return SizedBox();
            },
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.primary900,
        onPressed: () { context.read<SellerVariationsCubit>().onAddTap(context, variationsEnum: widget.variationsEnum); },
        child: Text("+",style: TextStyle(fontSize: 20.sp,color: AppTheme.neutral100),),
      ),
    ));
  }
}
