part of 'seller_home_cubit.dart';

@immutable
abstract class SellerHomeState {}

class SellerHomeInitial extends SellerHomeState {}

class SellerHomeSuccess extends SellerHomeState {
  static GetSellerOrdersResponse? sellerOrdersResponse;

  SellerHomeSuccess(GetSellerOrdersResponse sellerOrdersResponse){
    SellerHomeSuccess.sellerOrdersResponse = sellerOrdersResponse;
  }
}

class SellerHomeError extends SellerHomeState {
  static Failure failure = Failure("", failureCode: 0);

  SellerHomeError(Failure failure){
    SellerHomeError.failure = failure;
  }

}

class SellerHomeIsLoading extends SellerHomeState {}
