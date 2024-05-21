import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_soft/core/errors/failure.dart';
import 'package:smart_soft/features/cart/data/entities/cart_response.dart';
import 'package:smart_soft/features/cart/domain/usecase/add_to_cart_use_case.dart';
import 'package:smart_soft/features/cart/domain/usecase/get_cart_use_case.dart';
import 'package:smart_soft/features/cart/domain/usecase/remove_from_cart_use_case.dart';
import 'package:smart_soft/features/cart/views/screens/14_cart_screen.dart';
import 'package:smart_soft/features/home/views/screens/06_home_screen.dart';
import 'package:smart_soft/features/variation/views/bloc/button/button_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/chest/chest_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/collar/collar_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/embroidery/embroidery_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/fabric/fabric_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/front_pocket/front_pocket_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/size/size_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/sleeve/sleeve_cubit.dart';

import '../../../../../core/di/app_module.dart';
import '../../../../../core/views/widgets/custom_flush_bar.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../order/views/screens/customer_details_screen.dart';
import '../../../../seller/seller_home/data/entities/get_seller_orders_reponse.dart';
import '../../../../variation/views/bloc/variation/variation_cubit.dart';
import '../../../../variation/views/utils/design_model.dart';
import '../../../../variation/views/utils/size_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<DesignModel> designModels(SellerOrder sellerOrder) => [
    DesignModel(LocaleKeys.collar.tr(), sellerOrder.yakaName ?? "", sellerOrder.yakaUrl ?? "" ),
    DesignModel(LocaleKeys.chest.tr(),  sellerOrder.chestName ?? "", sellerOrder.chestUrl ?? ""),
    DesignModel(LocaleKeys.front_pocket.tr(),  sellerOrder.frontPocketName ?? "", sellerOrder.frontPocketUrl ?? ""),
    DesignModel(LocaleKeys.sleeve.tr(),  sellerOrder.handName ?? "", sellerOrder.handUrl ?? ""),
    DesignModel(LocaleKeys.button.tr(),  sellerOrder.buttonsName ?? "", sellerOrder.buttonsUrl ?? ""),
    DesignModel(LocaleKeys.embroidery.tr(),  sellerOrder.embroideryName ?? "", sellerOrder.embroideryUrl ?? ""),
  ];

  List<SizeModel> sizeModels(SellerOrder sellerOrder)  => [
    SizeModel(LocaleKeys.length.tr(), sellerOrder.height?.toDouble()  ?? 0),
    SizeModel(LocaleKeys.shoulder.tr(), sellerOrder.shoulder?.toDouble()  ?? 0),
    SizeModel(LocaleKeys.sleeve.tr(), sellerOrder.handSize?.toDouble()  ?? 0),
    SizeModel(LocaleKeys.chest.tr(), sellerOrder.chestWide?.toDouble()  ?? 0),
    SizeModel(LocaleKeys.neck.tr(), sellerOrder.neck?.toDouble()  ?? 0),
    SizeModel(LocaleKeys.hand.tr(), sellerOrder.armLenght?.toDouble()  ?? 0),
    SizeModel(LocaleKeys.cuff.tr(), sellerOrder.kbkLength?.toDouble()  ?? 0),
  ];


  getCart() async {
    emit(CartIsLoading());
    await getIt<GetCartUseCase>().call().then((value) => value.fold(
      (error) {
        emit(CartError(error));

      },
      (success) {
        emit(CartSuccess(success));
      }
    ));
  }

  addToCart(BuildContext context) async {
    emit(CartIsLoading());
    await getIt<AddToCartUseCase>().call(
        sellerId: (context.read<VariationCubit>().selectedSellerId ?? 1).toString(),
        length: context.read<SizeCubit>().lengthController.text,
        shoulder: context.read<SizeCubit>().shoulderController.text,
        sleeves: context.read<SizeCubit>().sleevesController.text,
        chest: context.read<SizeCubit>().chestController.text,
        neck: context.read<SizeCubit>().neckController.text,
        hand: context.read<SizeCubit>().handController.text,
        cuff: context.read<SizeCubit>().cuffController.text,
        fabricId: (context.read<FabricCubit>().fabricId ?? -1).toString(),
        collarId: (context.read<CollarCubit>().collarId ?? -1).toString(),
        chestId: (context.read<ChestCubit>().chestId ?? -1).toString(),
        frontPocketId: (context.read<FrontPocketCubit>().frontPocketId ?? -1).toString(),
        sleeveId: (context.read<SleeveCubit>().sleeveId ?? -1).toString(),
        buttonId: (context.read<ButtonCubit>().buttonId ?? -1).toString(),
        embroideryId: (context.read<EmbroideryCubit>().embroideryId ?? -1).toString()
    ).then((value) => value.fold(
        (error) {
          emit(CartError(error));
          showFlushBar(
              context,
              title: "Error ${error.failureCode}",
              message : error.message
          );
        },
        (success) {
          emit(CartSuccess(success));
          navigateToCartScreen(context);

        }
    ));

  }

  removeFromCart(BuildContext context,String cartItemId) async {
    emit(CartIsLoading());
    await getIt<RemoveFromCartUseCase>().call(cartItemId: cartItemId).then((value) => value.fold(
        (error) {
          emit(CartError(error));
          showFlushBar(
              context,
              title: "Error ${error.failureCode}",
              message : error.message
          );

        },
        (success) {
          emit(CartSuccess(success));
        }
    ));
  }

  onCheckoutClick(BuildContext context){
    navigateToCustomerDetailsScreen(context);
  }

  onContinueShoppingClick(BuildContext context){
    navigateToHomeScreen(context);
  }

  navigateToCustomerDetailsScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> CustomerDetailsScreen()));
  }

  navigateToHomeScreen(BuildContext context){
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_)=> HomeScreen()), (route) => false);
  }

  navigateToCartScreen(BuildContext context){
    int counter = 0;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_)=> CartScreen(showContinueButton: true,showBackButton: false,)),
            (Route<dynamic> route) {
              counter++;
              if(counter == 10){
                return true;
              }else {
                return false;
              }
            }
    );

  }

  onAddToCartTap(BuildContext context) {
    if(context.read<SizeCubit>().formKey.currentState!.validate()) {
      addToCart(context);
    }
  }



}
