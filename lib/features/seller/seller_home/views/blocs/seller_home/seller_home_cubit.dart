import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smart_soft/core/config/app_images.dart';
import 'package:smart_soft/features/seller/seller_home/domain/usecases/get_seller_orders_use_case.dart';

import '../../../../../../core/di/app_module.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../variation/views/utils/design_model.dart';
import '../../../../../variation/views/utils/size_model.dart';
import '../../../../seller_variations/views/screens/view_variations_categories_screen.dart';
import '../../../data/entities/get_seller_orders_reponse.dart';
import '../../screens/profile_screen.dart';
import '../../utils/user_info_model.dart';

part 'seller_home_state.dart';

class SellerHomeCubit extends Cubit<SellerHomeState> {
  SellerHomeCubit() : super(SellerHomeInitial());

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedIndex = 1;

  getSellerOrder() {
    emit(SellerHomeIsLoading());
    getIt<GetSellerOrdersUseCase>()
        .call(selectedIndex)
        .then((value) => value.fold(
            (error) {
              emit(SellerHomeError(error));

            },
            (success) {
              emit(SellerHomeSuccess(success));

            }
    ));
  }



  List<UserInfoModel> userModels(SellerOrder sellerOrder) => [
        UserInfoModel(AppImages.profile, sellerOrder.userName ?? '',),
        UserInfoModel(AppImages.phone, sellerOrder.phoneNumber ?? "",),
      ];

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

  onProfileClick(BuildContext context) {
    _navigateToProfileScreen(context);
  }

  _navigateToProfileScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
  }

  openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  onProfileTap(BuildContext context) {}

  onOrdersTap(BuildContext context) {}

  onViewSellersVariants(BuildContext context) {
    closeDrawer(context);
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => ViewVariationCategoriesScreen()));
  }

  closeDrawer(BuildContext context) {
    scaffoldKey.currentState?.closeDrawer();
  }
}
