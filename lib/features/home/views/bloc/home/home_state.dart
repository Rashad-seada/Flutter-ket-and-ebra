part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeSuccess extends HomeState {
  static GetHomeResponse? homeResponse;

  HomeSuccess(GetHomeResponse homeResponse){
    HomeSuccess.homeResponse = homeResponse;
  }

}

class HomeError extends HomeState {
  static Failure failure = Failure("", failureCode: 0);

  HomeError(Failure failure){
    HomeError.failure = failure;
  }
}

class HomeIsLoading extends HomeState {}

class HomePageChanged extends HomeState {}
