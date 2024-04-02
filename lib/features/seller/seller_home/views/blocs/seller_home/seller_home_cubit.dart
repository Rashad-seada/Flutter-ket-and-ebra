import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/core/config/app_images.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../variation/views/utils/design_model.dart';
import '../../../../../variation/views/utils/size_model.dart';
import '../../../../seller_variations/views/screens/view_variations_categories_screen.dart';
import '../../screens/profile_screen.dart';
import '../../utils/user_info_model.dart';

part 'seller_home_state.dart';

class SellerHomeCubit extends Cubit<SellerHomeState> {
  SellerHomeCubit() : super(SellerHomeInitial());

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  List<UserInfoModel> get userModels => [
    UserInfoModel(AppImages.profile,"رشاد محمد عاطف",),
    UserInfoModel(AppImages.phone,"01050687752",),
  ];

  List<DesignModel> get designModels => [
    DesignModel(LocaleKeys.collar.tr(),"",""),
    DesignModel(LocaleKeys.chest.tr(),"",""),
    DesignModel(LocaleKeys.front_pocket.tr(),"",""),
    DesignModel(LocaleKeys.sleeve.tr(),"",""),
    DesignModel(LocaleKeys.button.tr(),"",""),
    DesignModel(LocaleKeys.embroidery.tr(),"",""),
  ];

  List<SizeModel> get sizeModels => [
    SizeModel(LocaleKeys.length.tr(),30),
    SizeModel(LocaleKeys.shoulder.tr(),30),
    SizeModel(LocaleKeys.sleeve.tr(),30),
    SizeModel(LocaleKeys.chest.tr(),30),
    SizeModel(LocaleKeys.neck.tr(),30),
    SizeModel(LocaleKeys.hand.tr(),30),
    SizeModel(LocaleKeys.cuff.tr(),30),

  ];

  onProfileClick(BuildContext context){
    _navigateToProfileScreen(context);
  }

  _navigateToProfileScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> ProfileScreen()));
  }

  openDrawer(){
    scaffoldKey.currentState?.openDrawer();
  }

  onProfileTap(BuildContext context){

  }

  onOrdersTap(BuildContext context){

  }

  onViewSellersVariants(BuildContext context){
    closeDrawer(context);
    Navigator.push(context,MaterialPageRoute(builder: (_)=> ViewVariationCategoriesScreen()));
  }

  closeDrawer(BuildContext context){
    scaffoldKey.currentState?.closeDrawer();
  }

}
