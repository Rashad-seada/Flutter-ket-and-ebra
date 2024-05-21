import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/features/auth/domain/usecases/confirm_otp_use_case.dart';

import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/views/widgets/custom_flush_bar.dart';
import '../../../../home/views/screens/06_home_screen.dart';
import '../../../domain/usecases/send_otp_use_case.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  String pinCode = "";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validatePin() {
    if(pinCode.isEmpty) {
      return "Enter the pin code" ;
    } else if(pinCode.length != 6){
      return "Complete the pin code" ;
    } else {
      return null;
    }
  }

  onPinChange(String pin){
    pinCode = pin;
  }

  onConfirmClick(BuildContext context, registerType) {
    if(formKey.currentState!.validate()){
      confirmOtp(context, pinCode);
    }
  }

  onResendClick(BuildContext context,String phoneNumber){
    sendOtp( context, phoneNumber);
  }

  sendOtp(BuildContext context,String phoneNumber){
    emit(OtpLoading());
    getIt<SendOtpUseCase>().call(phoneNumber)
        .then((value) => value.fold(
            (error) {
          emit(OtpError(error));
          showFlushBar(
              context,
              title: "Error ${error.failureCode}",
              message : error.message
          );
          emit(OtpInitial());
        },
            (success) {
          emit(OtpSuccess());
          emit(OtpInitial());
        }
    ));
  }

  confirmOtp(BuildContext context,String otp){
    emit(OtpLoading());
    getIt<ConfirmOtpUseCase>().call(otp)
        .then((value) => value.fold(
            (error) {
          emit(OtpError(error));
          showFlushBar(
              context,
              title: "Error ${error.failureCode}",
              message : error.message
          );
          emit(OtpInitial());
        },
            (success) {
          emit(OtpSuccess());
          navigateToHomeScreen(context);
          emit(OtpInitial());
        }
    ));

  }

  navigateToHomeScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> const HomeScreen()));
  }


}
