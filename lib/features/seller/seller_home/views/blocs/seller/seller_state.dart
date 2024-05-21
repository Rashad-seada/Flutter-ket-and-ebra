part of 'seller_cubit.dart';

@immutable
abstract class SellerState {}

class SellerInitial extends SellerState {}

class SellerSuccess extends SellerState {
  static GetOneSellerResponse? sellerResponse;

  SellerSuccess(GetOneSellerResponse? sellerResponse){
    SellerSuccess.sellerResponse = sellerResponse;
  }
}

class SellerError extends SellerState {
  static Failure failure = Failure("", failureCode: 0);

  SellerError(Failure failure){
    SellerError.failure = failure;
  }
}

class SellerIsLoading extends SellerState {}

class SellerIsSaving extends SellerState {}
