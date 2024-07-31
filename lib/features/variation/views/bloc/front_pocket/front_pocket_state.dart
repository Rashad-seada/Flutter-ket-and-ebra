part of 'front_pocket_cubit.dart';

@immutable
abstract class FrontPocketState {}

class FrontPocketInitial extends FrontPocketState {}

class FrontPocketSuccess extends FrontPocketState {

  static List<FrontPocketEntity> frontPockets = [];

  FrontPocketSuccess(List<FrontPocketEntity> frontPockets){
    FrontPocketSuccess.frontPockets = frontPockets;
  }

}


class FrontPocketError extends FrontPocketState {
  static Failure error = Failure("", failureCode: 0);

  FrontPocketError(Failure error){
    FrontPocketError.error = error;
  }
}

class FrontPocketIsLoading extends FrontPocketState {}


class FrontPocketSelected extends FrontPocketState {}

class RefreshFrontPocketScreen extends FrontPocketState {}