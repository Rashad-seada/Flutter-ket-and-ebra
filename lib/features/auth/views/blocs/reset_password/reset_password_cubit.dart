import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/features/auth/views/screens/04_otp_screen.dart';

import '../../../../../core/core_feature/domain/usecases/validate_phone_use_case.dart';
import '../../../../../core/di/app_module.dart';
import '../../../utils/register_type.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  TextEditingController phoneNumberController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  onResetClick(BuildContext context,RegisterType registerType) {
    if(formKey.currentState!.validate()) {
      Navigator.push(context,MaterialPageRoute(builder: (_)=> OtpScreen(phoneNumber: phoneNumberController.text, registerType: registerType,)));
    }
  }

  String? validatePhone(){
    return getIt<ValidatePhoneUseCase>().call(phoneNumberController.text);
  }


}
