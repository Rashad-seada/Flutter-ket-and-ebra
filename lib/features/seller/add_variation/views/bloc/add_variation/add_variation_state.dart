part of 'add_variation_cubit.dart';

@immutable
abstract class AddVariationState {}

class AddVariationInitial extends AddVariationState {}

class AddVariationSelectingImage extends AddVariationState {}

class AddVariationSuccess extends AddVariationState {}

class AddVariationError extends AddVariationState {}

class AddVariationIsLoading extends AddVariationState {}
