part of 'chest_cubit.dart';

@immutable
abstract class ChestState {}

class ChestInitial extends ChestState {}


class ChestSuccess extends ChestState {

  static List<ChestEntity> chests = [];

  ChestSuccess(List<ChestEntity> chests){
    ChestSuccess.chests = chests;
  }

}


class ChestError extends ChestState {
  static Failure error = Failure("", failureCode: 0);

  ChestError(Failure error){
    ChestError.error = error;
  }
}

class ChestIsLoading extends ChestState {}


class ChestSelected extends ChestState {}

class RefreshChestScreen extends ChestState {}
