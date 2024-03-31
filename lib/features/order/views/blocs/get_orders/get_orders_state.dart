part of 'get_orders_cubit.dart';

@immutable
abstract class GetOrdersState {}

class GetOrdersInitial extends GetOrdersState {}

class GetOrdersSuccess extends GetOrdersState {

  static GetAllOrdersResponse? getAllOrdersResponse;

  GetOrdersSuccess(GetAllOrdersResponse? getAllOrdersResponse){
    GetOrdersSuccess.getAllOrdersResponse = getAllOrdersResponse;
  }

}

class GetOrdersError extends GetOrdersState {
  static Failure failure = Failure("", failureCode: 0);

  GetOrdersError(Failure failure){
    GetOrdersError.failure = failure;
  }
}

class GetOrdersIsLoading extends GetOrdersState {}
