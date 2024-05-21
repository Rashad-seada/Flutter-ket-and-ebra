import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/admin/admin_home/data/entities/get_admin_home_response.dart';
import 'package:smart_soft/features/admin/admin_home/domain/usecases/get_admin_home_use_case.dart';
import 'package:smart_soft/features/admin/admin_home/views/screens/pending_seller_screen.dart';

import '../../../../../../core/errors/failure.dart';
import '../../screens/view_ads_items_screen.dart';

part 'admin_home_state.dart';

class AdminHomeCubit extends Cubit<AdminHomeState> {
  AdminHomeCubit() : super(AdminHomeInitial());

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  openDrawer(){
    scaffoldKey.currentState?.openDrawer();
  }

  closeDrawer(BuildContext context){
    scaffoldKey.currentState?.closeDrawer();
  }

  onPendingSellerRequestClick(BuildContext context, List<ReturnListofReq> list){
    _navigateToPendingSellerRequest(context,list);
  }

  _navigateToPendingSellerRequest(BuildContext context, List<ReturnListofReq> list){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> PendingSellerScreen(list: list,)));
  }

  getAdminHome(){
    emit(AdminHomeIsLoading());
    getIt<GetAdminHomeUseCase>().call().then((value) => value.fold(
            (error) {
              emit(AdminHomeError(error));

            },
            (success) {
              emit(AdminHomeSuccess(success));

            }
    ));
  }

  onHomeAdsTap(BuildContext context) {
    Navigator.push(context,MaterialPageRoute(builder: (_)=> ViewAdsItemsScreen()));
  }

}
