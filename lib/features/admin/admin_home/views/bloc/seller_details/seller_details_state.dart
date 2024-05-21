part of 'seller_details_cubit.dart';

@immutable
abstract class SellerDetailsState {}

class SellerDetailsInitial extends SellerDetailsState {}

class SellerDetailsRejectIsLoading extends SellerDetailsState {}

class SellerDetailsAcceptIsLoading extends SellerDetailsState {}

class SellerDetailsError extends SellerDetailsState {}

class SellerDetailsSuccess extends SellerDetailsState {}
