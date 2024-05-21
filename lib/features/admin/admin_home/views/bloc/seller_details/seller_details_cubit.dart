import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/admin/admin_home/domain/usecases/approve_seller_use_case.dart';
import 'package:smart_soft/features/admin/admin_home/views/bloc/admin_home/admin_home_cubit.dart';
import 'package:smart_soft/features/admin/admin_home/views/screens/admin_home_screen.dart';

import '../../../../../../core/views/widgets/custom_flush_bar.dart';

part 'seller_details_state.dart';

class SellerDetailsCubit extends Cubit<SellerDetailsState> {
  SellerDetailsCubit() : super(SellerDetailsInitial());

  onAcceptTap(BuildContext context,int sellerId) {
    emit(SellerDetailsAcceptIsLoading());
    getIt<ApproveSellerUseCase>().call(isApproved: true, sellerId: sellerId).then(
      (value) => value.fold(
        (error) {
          emit(SellerDetailsError());
          showFlushBar(
              context,
              title: "Error ${error.failureCode}",
              message : error.message
          );
        },
        (success) {
          emit(SellerDetailsSuccess());
          context.read<AdminHomeCubit>().getAdminHome();
          Navigator.pop(context);
        }
      )
    );
  }

  onRejectTap(BuildContext context,int sellerId) {
    emit(SellerDetailsRejectIsLoading());
    getIt<ApproveSellerUseCase>().call(isApproved: false, sellerId: sellerId).then(
            (value) => value.fold(
              (error) {
                emit(SellerDetailsError());
                showFlushBar(
                    context,
                    title: "Error ${error.failureCode}",
                    message : error.message
                );
              },
              (success) {
                emit(SellerDetailsSuccess());
                context.read<AdminHomeCubit>().getAdminHome();
                Navigator.pop(context);
              }
        )
    );
  }
}
