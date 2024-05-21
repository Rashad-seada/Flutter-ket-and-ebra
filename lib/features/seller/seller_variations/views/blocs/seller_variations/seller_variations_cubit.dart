import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/core/errors/failure.dart';
import 'package:smart_soft/features/seller/seller_variations/data/utils/variants_enum.dart';
import 'package:smart_soft/features/seller/seller_variations/domain/usecase/delete_seller_variant_use_case.dart';
import 'package:smart_soft/features/seller/seller_variations/domain/usecase/get_seller_variant_use_case.dart';

import '../../../../../../core/di/app_module.dart';
import '../../../../../../core/views/widgets/custom_flush_bar.dart';
import '../../../../add_variation/views/screens/add_variation_screen.dart';
import '../../screens/view_variation_items_screen.dart';
import '../../utils/seller_variation_model.dart';
import '../../utils/variations_enum.dart';

part 'seller_variations_state.dart';

class SellerVariationsCubit extends Cubit<SellerVariationsState> {
  SellerVariationsCubit() : super(SellerVariationsInitial());

  onSellerVariationsTap(BuildContext context,{required VariationsEnum variationsEnum,}){
    Navigator.push(context,MaterialPageRoute(builder: (context)=> ViewVariationItemsScreen(variationsEnum: variationsEnum,)));
  }

  getVariation(BuildContext context,{required VariationsEnum variationsEnum,}){
    emit(SellerVariationsIsLoading());
    switch(variationsEnum){

      case VariationsEnum.Fabric:
        getVariant(context, VariantsEnum.fabric);

      case VariationsEnum.Collar:
        getVariant(context, VariantsEnum.collar);

      case VariationsEnum.FrontPocket:
        getVariant(context, VariantsEnum.frontPocket);

      case VariationsEnum.Chest:
        getVariant(context, VariantsEnum.chest);

      case VariationsEnum.Sleeve:
        getVariant(context, VariantsEnum.sleeves);

      case VariationsEnum.Button:
        getVariant(context, VariantsEnum.buttons);

      case VariationsEnum.Embroidery:
        getVariant(context, VariantsEnum.embroidery);

    }


  }

  getVariant(BuildContext context,int variantNumber){
    getIt<GetSellerVariantUseCase>().call(variantNumber: variantNumber).then(
      (value) => value.fold(
        (error) {

          emit(SellerVariationsError(error));
          showFlushBar(
              context,
              title: "Error ${error.failureCode}",
              message : error.message
          );
        },
        (success) {

          emit(SellerVariationsSuccess(success.obj?.map((e) => SellerVariationModel(
              name: e.name ?? '',
              imageUrl: e.imgUrl ?? '',
              id: e.id ?? 0,
              price: e.price ?? 0.0,
          )).toList() ?? []));

        }
      )
    );
  }

  deleteVariant(BuildContext context,int variantNumber,int variantId) async {
    emit(SellerVariationsIsLoading());

    await getIt<DeleteSellerVariantUseCase>().call(variantNumber: variantNumber, id: variantId).then(
            (value) => value.fold(
                (error) {
                  showFlushBar(
                      context,
                      title: "Error ${error.failureCode}",
                      message : error.message
                  );
              emit(SellerVariationsError(error));

            },
            (success) async {

            }
        )
    );
  }


  void onAddTap(BuildContext context,{required VariationsEnum variationsEnum}) {
    Navigator.push(context, MaterialPageRoute(builder: (_)=> AddVariationScreen(variationsEnum: variationsEnum)));
  }

  void onDelete(BuildContext context, int variantType, int id,VariationsEnum variationsEnum) async {
    await deleteVariant(context,variantType,id);
    await getVariation(context, variationsEnum: variationsEnum);

  }

}
