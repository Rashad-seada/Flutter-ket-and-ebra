part of 'add_ads_cubit.dart';

@immutable
abstract class AddAdsState {}

class AddAdsInitial extends AddAdsState {}

class AddAdsError extends AddAdsState {}

class AddAdsSuccess extends AddAdsState {}

class AddAdsIsLoading extends AddAdsState {}

class AddAdsImageChanging extends AddAdsState {}
