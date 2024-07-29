part of 'sleeve_cubit.dart';

@immutable
abstract class SleeveState {}

class SleeveInitial extends SleeveState {}


class SleeveSuccess extends SleeveState {

  static List<HandEntity> sleeves = [];

  SleeveSuccess(List<HandEntity> sleeves){
    SleeveSuccess.sleeves = sleeves;
  }

}


class SleeveError extends SleeveState {
  static Failure error = Failure("", failureCode: 0);

  SleeveError(Failure error){
    SleeveError.error = error;
  }
}

class SleeveIsLoading extends SleeveState {}

class SleeveSelected extends SleeveState {}