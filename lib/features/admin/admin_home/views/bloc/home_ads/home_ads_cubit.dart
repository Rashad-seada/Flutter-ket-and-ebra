import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/admin/admin_home/data/entities/get_home_ads_by_admin_response.dart';
import 'package:smart_soft/features/admin/admin_home/domain/usecases/delete_home_ads_by_admin_use_case.dart';
import 'package:smart_soft/features/admin/admin_home/domain/usecases/get_home_ads_by_admin_use_case.dart';

import '../../../../../../core/errors/failure.dart';
import '../../screens/add_ads_screen.dart';

part 'home_ads_state.dart';

class HomeAdsCubit extends Cubit<HomeAdsState> {
  HomeAdsCubit() : super(HomeAdsInitial());

  void onAddTap(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_)=> AddAdsScreen() ));
  }

  void getHomeAds() {
    emit(HomeAdsIsLoading());
    getIt<GetHomeAdsByAdminUseCase>().call().then((value) => value.fold(
        (error) {
          emit(HomeAdsError(error));

        },
        (success) {
          emit(HomeAdsSuccess(success));

        }
    ));
  }

  void onDelete(BuildContext context, int id) {
    emit(HomeAdsIsLoading());
    getIt<DeleteHomeAdsByAdminUseCase>().call(adId: id).then((value) => value.fold(
        (error) {
          emit(HomeAdsError(error));

        },
        (success) {
          getHomeAds();

        }
    ));
  }
}
