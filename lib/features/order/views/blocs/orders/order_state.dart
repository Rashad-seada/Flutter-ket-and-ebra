part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderSuccess extends OrderState {
  static GetAllCitiesResponse? allCitiesResponse;
  static CreateOrderResponse? createOrderResponse;

  OrderSuccess({GetAllCitiesResponse? allCitiesResponse,CreateOrderResponse? createOrderResponse}){
    OrderSuccess.allCitiesResponse = allCitiesResponse;
    OrderSuccess.createOrderResponse = createOrderResponse;
  }

}

class OrderError extends OrderState {
  static Failure failure = Failure("",failureCode: 0);

  OrderError(Failure failure){
    OrderError.failure = failure;
  }
}

class OrderIsLoading extends OrderState {
  static bool citiesIsLoading = false;
  static bool createOrderIsLoading = false;

  OrderIsLoading({bool citiesIsLoading = false,bool createOrderIsLoading = false,}){
    OrderIsLoading.citiesIsLoading = citiesIsLoading;
    OrderIsLoading.createOrderIsLoading = createOrderIsLoading;
  }

}

