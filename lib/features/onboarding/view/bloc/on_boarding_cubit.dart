import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:smart_soft/features/auth/views/screens/00_auth_methods_screen.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  int index = 0;
  PageController controller = PageController();

  onPageChanged(int index) {
    this.index = index;
    emit(OnBoardingIndexChanging());
    emit(OnBoardingInitial());
  }

  onNextClick(BuildContext context) {
    if (index == 2) {
      navigateToAuthMethodsScreen(context);

    } else {
      index += 1;
      controller.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  onSkipCLick(BuildContext context) {
    navigateToAuthMethodsScreen(context);
  }

  navigateToAuthMethodsScreen(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AuthMethodsScreen()),);

  }
}
