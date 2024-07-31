import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/features/variation/data/entities/embroidery_entity.dart';
import 'package:smart_soft/features/variation/domain/usecases/get_embroidery_by_seller_id_use_case.dart';

import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/failure.dart';
import '../variation/variation_cubit.dart';

part 'embroidery_state.dart';

class EmbroideryCubit extends Cubit<EmbroideryState> {
  EmbroideryCubit() : super(EmbroideryInitial());

  int embroideryId = -1;


  getEmbroidery(BuildContext context){
    emit(EmbroideryIsLoading());
    getIt<GetEmbroideryBySellerIdUseCase>().call(context.read<VariationCubit>().selectedSellerId).then(
            (value) => value.fold(
            (error) {
              emit(EmbroideryError(error));

            },
            (success) {
              emit(EmbroiderySuccess(success.obj ?? []));
            }
        ));
  }

  void onEmbroideryTap(int embroideryId, BuildContext context) {
    this.embroideryId = embroideryId;
   // context.read<VariationCubit>().onEmbroideryNextClick(context);
  }

  next(BuildContext context){
    context.read<VariationCubit>().onEmbroideryNextClick(context);

  }

}
