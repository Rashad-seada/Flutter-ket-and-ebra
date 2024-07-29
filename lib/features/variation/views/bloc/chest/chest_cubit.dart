import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/features/variation/data/entities/chest_entity.dart';
import 'package:smart_soft/features/variation/domain/usecases/get_chest_by_seller_id_use_case.dart';

import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/failure.dart';
import '../../../domain/usecases/get_front_pocket_by_seller_id_use_case.dart';
import '../variation/variation_cubit.dart';

part 'chest_state.dart';

class ChestCubit extends Cubit<ChestState> {
  ChestCubit() : super(ChestInitial());

 // int chestId = -1;
  int chestId =0;

  List<String> chests = [
    "images/chest1.png",
    "images/chest2.png",
    "images/chest3.png",
    "images/chest4.png",
    "images/chest5.png",
    "images/chest6.png",

  ];

  getChest(BuildContext context){
    emit(ChestIsLoading());
    getIt<GetChestBySellerIdUseCase>().call(context.read<VariationCubit>().selectedSellerId).then(
            (value) => value.fold(
                (error) {
              emit(ChestError(error));

            },
                (success) {
              emit(ChestSuccess(success.obj ?? []));
            }
        ));
  }

  void onChestTap(int chestId, BuildContext context) {
    this.chestId = chestId;
    emit(ChestSelected());
    //context.read<VariationCubit>().onChestNextClick(context);
  }

  next(BuildContext context){
    context.read<VariationCubit>().onChestNextClick(context);

  }
}
