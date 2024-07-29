part of 'collar_cubit.dart';

@immutable
abstract class CollarState {}

class CollarInitial extends CollarState {}

class CollarSuccess extends CollarState {

  static List<CollarEntity> collars = [];

  CollarSuccess(List<CollarEntity> collars){
    CollarSuccess.collars = collars;
  }

}


class CollarError extends CollarState {
  static Failure error = Failure("", failureCode: 0);

  CollarError(Failure error){
    CollarError.error = error;
  }
}

class CollarIsLoading extends CollarState {}


class CollarSelected extends CollarState {}

