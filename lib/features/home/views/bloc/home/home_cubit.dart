import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/core/config/app_theme.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/core/errors/failure.dart';
import 'package:smart_soft/features/auth/domain/usecases/delete_user_use_case.dart';
import 'package:smart_soft/features/auth/views/screens/00_auth_methods_screen.dart';
import 'package:smart_soft/features/auth/views/screens/01_login_screen.dart';
import 'package:smart_soft/features/cart/views/screens/14_cart_screen.dart';
import 'package:smart_soft/features/home/data/entities/get_home_response.dart';
import 'package:smart_soft/features/home/domain/usecases/get_home_ads_use_case.dart';
import 'package:smart_soft/features/order/views/screens/orders_screen.dart';
import 'package:smart_soft/features/variation/views/screens/07_tailor_screen.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  closeDrawer(BuildContext context){
    scaffoldKey.currentState?.closeDrawer();
  }

  openDrawer(){
    scaffoldKey.currentState?.openDrawer();
  }

  getHomeAds(){
    emit(HomeIsLoading());
    getIt<GetHomeAdsUseCase>().call().then((value) => value.fold(
            (error) {
              emit(HomeError(error));
            },
            (success) {
              emit(HomeSuccess(success));
            }
    ));
  }

  navigateToOrders(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> const OrdersScreen()));
  }



  navigateToVariation(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> const TailorScreen()));
  }

  navigateToCartScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> CartScreen(
      showContinueButton: false,
    )));
  }

  onLogoutTap(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppTheme.neutral100,
          title: Text('Logout'),
          content: Text('Do you realy want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                logout(context);
              },
              child: Text('Logout',style: TextStyle(color: AppTheme.error),),
            ),

            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel',style: TextStyle(color: AppTheme.neutral700)),
            ),
          ],
        );
      },
    );
  }

  logout(BuildContext context){
    getIt<DeleteUserUseCase>().call().then((value) => value.fold(
            (error) {

            },
            (success) {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> AuthMethodsScreen()), (route) => false);
            }
    )
    );
  }

}
