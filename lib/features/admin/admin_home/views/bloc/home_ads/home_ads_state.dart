part of 'home_ads_cubit.dart';

@immutable
abstract class HomeAdsState {}

class HomeAdsInitial extends HomeAdsState {}

class HomeAdsIsLoading extends HomeAdsState {}

class HomeAdsSuccess extends HomeAdsState {
  static GetHomeAdsByAdminResponse? homeAdsByAdminResponse;

  HomeAdsSuccess(GetHomeAdsByAdminResponse? success){
    HomeAdsSuccess.homeAdsByAdminResponse = success;
  }
}

class HomeAdsError extends HomeAdsState {
  static Failure failure = Failure("", failureCode: 0);
  HomeAdsError(Failure failure){
    HomeAdsError.failure = failure;
  }
}
