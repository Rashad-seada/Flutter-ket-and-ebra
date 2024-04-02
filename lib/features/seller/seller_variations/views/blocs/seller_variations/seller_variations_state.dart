part of 'seller_variations_cubit.dart';

@immutable
abstract class SellerVariationsState {}

class SellerVariationsInitial extends SellerVariationsState {}

class SellerVariationsSuccess extends SellerVariationsState {

  static List<SellerVariationModel>? sellerVariationModels;

  SellerVariationsSuccess(List<SellerVariationModel> sellerVariationModels){
    SellerVariationsSuccess.sellerVariationModels = sellerVariationModels;
  }

}

class SellerVariationsError extends SellerVariationsState {
  static Failure failure = Failure("", failureCode: 0);

  SellerVariationsError(Failure failure){
    SellerVariationsError.failure = failure;
  }
}

class SellerVariationsIsLoading extends SellerVariationsState {

}
