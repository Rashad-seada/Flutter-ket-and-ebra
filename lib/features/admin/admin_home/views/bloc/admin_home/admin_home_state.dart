part of 'admin_home_cubit.dart';

@immutable
abstract class AdminHomeState {}

class AdminHomeInitial extends AdminHomeState {}

class AdminHomeSuccess extends AdminHomeState {
  static GetAdminHomeResponse? adminHome;
  AdminHomeSuccess(GetAdminHomeResponse? getAdminHomeResponse){
    AdminHomeSuccess.adminHome = getAdminHomeResponse;
  }
}

class AdminHomeError extends AdminHomeState {
  static Failure failure = Failure("", failureCode: 0);
  AdminHomeError(Failure failure){
    AdminHomeError.failure = failure;
  }
}

class AdminHomeIsLoading extends AdminHomeState {}
