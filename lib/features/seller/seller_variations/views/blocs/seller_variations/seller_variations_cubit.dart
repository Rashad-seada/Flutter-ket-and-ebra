import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/core/errors/failure.dart';
import 'package:smart_soft/features/auth/domain/usecases/get_user_use_case.dart';

import '../../../../../../core/di/app_module.dart';
import '../../../../../variation/domain/usecases/get_button_by_seller_id_use_case.dart';
import '../../../../../variation/domain/usecases/get_chest_by_seller_id_use_case.dart';
import '../../../../../variation/domain/usecases/get_collar_by_seller_id_use_case.dart';
import '../../../../../variation/domain/usecases/get_embroidery_by_seller_id_use_case.dart';
import '../../../../../variation/domain/usecases/get_fabric_by_seller_id_use_case.dart';
import '../../../../../variation/domain/usecases/get_front_pocket_by_seller_id_use_case.dart';
import '../../../../../variation/domain/usecases/get_sleeve_by_seller_id_use_case.dart';
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
    getIt<GetUserUseCase>().call().then((value) => value.fold(
            (error) {
              emit(SellerVariationsError(error));
            },
            (success) {

              switch(variationsEnum){
                case VariationsEnum.Fabric:
                  getFabric(context, int.tryParse(success.id ?? '') ?? 0);

                case VariationsEnum.Collar:
                  getCollars(context, int.tryParse(success.id ?? '') ?? 0);

                case VariationsEnum.FrontPocket:
                  getFrontPocket(context, int.tryParse(success.id ?? '') ?? 0);

                case VariationsEnum.Chest:
                  getChest(context, int.tryParse(success.id ?? '') ?? 0);

                case VariationsEnum.Sleeve:
                  getSleeve(context, int.tryParse(success.id ?? '') ?? 0);

                case VariationsEnum.Button:
                  getButton(context, int.tryParse(success.id ?? '') ?? 0);

                case VariationsEnum.Embroidery:
                  getEmbroidery(context, int.tryParse(success.id ?? '') ?? 0);

              }

            }
    ));


  }

  getButton(BuildContext context,int sellerId){
    getIt<GetButtonBySellerIdUseCase>().call(sellerId).then(
            (value) => value.fold(
                (error) {
              emit(SellerVariationsError(error));

            },
                (success) {
              emit(SellerVariationsSuccess(success.obj?.map((e) => SellerVariationModel(
                  name: e.name ?? '',
                  imageUrl: e.imgUrl ?? '',
                  id: e.id ?? 0,
                  price: e.price ?? 0.0
              )).toList() ?? []));
            }
        ));
  }

  getChest(BuildContext context,int sellerId){
    getIt<GetChestBySellerIdUseCase>().call(sellerId).then(
            (value) => value.fold(
                (error) {
              emit(SellerVariationsError(error));

            },
                (success) {
                  emit(SellerVariationsSuccess(success.obj?.map((e) => SellerVariationModel(
                      name: e.name ?? '',
                      imageUrl: e.imgUrl ?? '',
                      id: e.id ?? 0,
                  )).toList() ?? []));
            }
        ));
  }

  getCollars(BuildContext context,int sellerId){
    getIt<GetCollarBySellerIdUseCase>().call(sellerId).then(
            (value) => value.fold(
                (error) {
              emit(SellerVariationsError(error));

            },
                (success) {
                  emit(SellerVariationsSuccess(success.obj?.map((e) => SellerVariationModel(
                      name: e.name ?? '',
                      imageUrl: e.imgUrl ?? '',
                      id: e.id ?? 0,
                  )).toList() ?? []));

            }
        ));
  }

  getEmbroidery(BuildContext context,int sellerId){
    getIt<GetEmbroideryBySellerIdUseCase>().call(sellerId).then(
            (value) => value.fold(
            (error) {
              emit(SellerVariationsError(error));

            },
                (success) {
                  emit(SellerVariationsSuccess(success.obj?.map((e) => SellerVariationModel(
                      name: e.name ?? '',
                      imageUrl: e.imgUrl ?? '',
                      id: e.id ?? 0,
                      price: e.price ?? 0.0
                  )).toList() ?? []));
            }
        ));
  }

  getFabric(BuildContext context,int sellerId){
    getIt<GetFabricBySellerIdUseCase>().call(sellerId).then(
            (value) => value.fold(
            (error) {
              emit(SellerVariationsError(error));

            },
            (success) {
                  emit(SellerVariationsSuccess(success.obj?.map((e) => SellerVariationModel(
                      name: e.name ?? '',
                      imageUrl: e.imgUrl ?? '',
                      id: e.id ?? 0,
                      price: e.price ?? 0.0
                  )).toList() ?? []));
            }
        ));
  }

  getFrontPocket(BuildContext context,int sellerId){
    getIt<GetFrontPocketBySellerIdUseCase>().call(sellerId).then(
            (value) => value.fold(
                (error) {
              emit(SellerVariationsError(error));

            },
                (success) {
                  emit(SellerVariationsSuccess(success.obj?.map((e) => SellerVariationModel(
                      name: e.name ?? '',
                      imageUrl: e.imgUrl ?? '',
                      id: e.id ?? 0,
                  )).toList() ?? []));
            }
        ));
  }

  getSleeve(BuildContext context,int sellerId){
    getIt<GetSleeveBySellerIdUseCase>().call(sellerId).then(
            (value) => value.fold(
                (error) {
              emit(SellerVariationsError(error));
            },
                (success) {
                  emit(SellerVariationsSuccess(success.obj?.map((e) => SellerVariationModel(
                      name: e.name ?? '',
                      imageUrl: e.imgUrl ?? '',
                      id: e.id ?? 0,
                  )).toList() ?? []));
            }
        ));
  }

  void onAddTap(BuildContext context,{required VariationsEnum variationsEnum}) {
    Navigator.push(context, MaterialPageRoute(builder: (_)=> AddVariationScreen(variationsEnum: variationsEnum,)));
  }

}
