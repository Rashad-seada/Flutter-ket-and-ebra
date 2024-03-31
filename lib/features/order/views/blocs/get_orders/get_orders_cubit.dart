import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/core/errors/failure.dart';
import 'package:smart_soft/features/order/data/entities/get_all_orders_response.dart';
import 'package:smart_soft/features/order/domain/usecases/get_order_use_case.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit() : super(GetOrdersInitial());


  getOrder(){
    emit(GetOrdersIsLoading());
    getIt<GetOrderUseCase>().call().then((value) => value.fold(
            (error) {
              emit(GetOrdersError(error));

            },
            (success) {
              emit(GetOrdersSuccess(success));

            }
    ));
  }

}
