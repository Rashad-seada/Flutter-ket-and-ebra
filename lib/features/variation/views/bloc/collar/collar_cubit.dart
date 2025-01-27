import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/features/variation/data/entities/coller_entity.dart';
import 'package:smart_soft/features/variation/domain/usecases/get_collar_by_seller_id_use_case.dart';

import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/failure.dart';
import '../variation/variation_cubit.dart';

part 'collar_state.dart';

class CollarCubit extends Cubit<CollarState> {
  CollarCubit() : super(CollarInitial());

  int collarId = 0;

  List<String> collars = [
    // "images/yaka0.svg",
    // "images/yaka1.svg",
    // "images/yaka2.svg",
    // "images/yaka3.svg"
"images/collar/صيني دائري.svg",
    "images/collar/صيني دائري مسكر.svg",
    "images/collar/صيني دائري مفتوح.svg",
    "images/collar/صيني مربع.svg",
    "images/collar/صيني مربع مسكر.svg",
    "images/collar/صيني مربع مفتوح.svg",
    "images/collar/عادي.svg",

    "عادي مخفي.svg",
    "images/collar/عادي مخفي مشطوف.svg",
    "images/collar/قلاب.svg",
    "images/collar/قلاب فرنسي.aiمخفي.svg",
    "images/collar/قلاب فرنسي.svg",
    "images/collar/قلاب مخفي.svg",
    "images/collar/قلاب مسكر.svg",
    "images/collar/قلاب مسكر خفي .svg"

  ];

  getCollars(BuildContext context) {
    emit(CollarIsLoading());
    getIt<GetCollarBySellerIdUseCase>()
        .call(context.read<VariationCubit>().selectedSellerId)
        .then((value) => value.fold((error) {
              emit(CollarError(error));
            }, (success) {
              emit(CollarSuccess(success.obj ?? []));
            }));
  }

  void onCollarCardTap(int collarId, BuildContext context) {
    this.collarId = collarId;
    emit(CollarSelected());
    //context.read<VariationCubit>().onCollarNextClick(context);
  }

  next(BuildContext context) {
    context.read<VariationCubit>().onCollarNextClick(context);
  }

  refresh() {
    emit(RefreshCollarScreen());
  }
}
