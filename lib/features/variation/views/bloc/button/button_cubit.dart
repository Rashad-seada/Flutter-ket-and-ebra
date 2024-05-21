import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/features/variation/data/entities/button_entity.dart';
import 'package:smart_soft/features/variation/domain/usecases/get_button_by_seller_id_use_case.dart';

import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/failure.dart';
import '../../../domain/usecases/get_chest_by_seller_id_use_case.dart';
import '../variation/variation_cubit.dart';

part 'button_state.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitial());

  int buttonId = -1;


  getButton(BuildContext context){
    emit(ButtonIsLoading());
    getIt<GetButtonBySellerIdUseCase>().call(context.read<VariationCubit>().selectedSellerId).then(
            (value) => value.fold(
            (error) {
              emit(ButtonError(error));

            },
            (success) {
              emit(ButtonSuccess(success.obj ?? []));

            }
        ));
  }

  void onButtonTap(int buttonId, BuildContext context) {
    this.buttonId = buttonId;
    context.read<VariationCubit>().onButtonNextClick(context);
  }
}
