import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_soft/core/infrastructure/services/image_picker_service.dart';
import 'package:smart_soft/features/auth/domain/usecases/register_customer_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/register_seller_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/send_otp_use_case.dart';
import 'package:smart_soft/features/auth/utils/register_type.dart';
import 'package:smart_soft/features/auth/views/screens/00_auth_methods_screen.dart';
import 'package:smart_soft/features/auth/views/screens/01_login_screen.dart';
import 'package:smart_soft/features/auth/views/screens/04_otp_screen.dart';
import 'package:smart_soft/features/auth/views/screens/05_message_screen.dart';

import '../../../../../core/core_feature/data/entities/citie_entity.dart';
import '../../../../../core/core_feature/data/entities/get_all_cities_response.dart';
import '../../../../../core/core_feature/domain/usecases/get_all_cities_use_case.dart';
import '../../../../../core/core_feature/domain/usecases/validate_password_use_case.dart';
import '../../../../../core/core_feature/domain/usecases/validate_phone_use_case.dart';
import '../../../../../core/core_feature/domain/usecases/validate_username_use_case.dart';
import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/worker.dart';
import '../../../../../core/views/widgets/custom_flush_bar.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../home/views/screens/06_home_screen.dart';
import '../../../../seller/seller_home/views/screens/seller_home_screen.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Worker? job;

  List<CityEntity> allCities = [];
  CityEntity? selectedCity;

  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController tradeRegisterController = TextEditingController();
  TextEditingController taxIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  XFile? file;

  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validateUsername() {
    return getIt<ValidateUsernameUseCase>().call(usernameController.text);
  }

  getAllCities(){
    emit(RegisterGettingCities());
    getIt<GetAllCitiesUseCase>().call().then((value) => value.fold(
            (error) {
              print(error.message);
              emit(RegisterGettingCitiesError());
              getAllCities();
            },
            (success) {
              allCities = success.obj ?? [];
              selectedCity = success.obj?[0];
              emit(RegisterInitial());

            }
    ));
  }


  String? validatePhone() {
    if(phoneNumberController.text.isEmpty){
      return "يجب عليك ادخال الرقم الخاص بك";
    } else if(int.tryParse(phoneNumberController.text) == null){
      return "يجب ادخال ارقام فقط";
    }
  }

  String? validateTradeRegister() {
    if (tradeRegisterController.text.trim().isEmpty) {
      return "Please Enter your trade register";
    } else if(int.tryParse(tradeRegisterController.text) == null){
      return "يجب ادخال ارقام فقط";
    }
  }

  String? validateTaxId() {
    if (taxIdController.text.trim().isEmpty) {
      return "Please Enter your Tax Id";
    } else if(int.tryParse(taxIdController.text) == null){
      return "يجب ادخال ارقام فقط";
    }
  }

  String? validatePassword() {
    return getIt<ValidatePasswordUseCase>().call(passwordController.text);
  }

  onRegisterClick(BuildContext context,RegisterType registerType) {
    if(formKey.currentState!.validate()){

      // _sendOtp(context,registerType);
      _register(context,registerType);
    }
  }

  onLoginClick(BuildContext context) {
    _navigateToLoginScreen(context);
  }

  onDoneClick(BuildContext context) {
    _navigateToAuthMethodsScreen(context);
  }

  onUploadClick() async {
    await _pickPhoto();
  }

  _pickPhoto() async {
    emit(RegisterPickPhoto());
    file = await getIt<ImagePickerService>().pickImageFromGallery();
    emit(RegisterInitial());
  }

  String formatPhoneNumber(String phoneNumber){
    String formatedPhoneNumber = "";
    for(int i = 0; i < phoneNumber.length ; i++) {
      if(int.tryParse(phoneNumber[i]) != null) {
        formatedPhoneNumber += phoneNumber[i];
      }
    }
    return formatedPhoneNumber;
  }

  _register(BuildContext context,RegisterType registerType){
    switch (registerType){

      case RegisterType.RegisterCustomer:
        _registerCustomer(context);

      case RegisterType.RegisterSeller :
        _registerSeller(context);
    }
  }

  _registerSeller(BuildContext context) {

    if(selectedCity == null) {
      showFlushBar(
          context,
          title: "Error",
          message: "Please select your location"
      );
    } else if(file == null){
      showFlushBar(
          context,
          title: "Error",
          message: "Please upload the registration certificate"
      );
    } else {
      emit(RegisterLoading());
      getIt<RegisterSellerUseCase>()
          .call(
          username: usernameController.text,
          phoneNumber: formatPhoneNumber(phoneNumberController.text),
          tradeRegister: tradeRegisterController.text,
          taxId: taxIdController.text,
          password: passwordController.text,
          locationId: selectedCity!.id.toString(),
          registerImg: file!

      ).then((value) => value.fold((error) {
        emit(RegisterError(error));
        showFlushBar(context,
            title: "Error ${error.failureCode}", message: error.message);
        emit(RegisterInitial());
      }, (success) {
        emit(RegisterSuccess());
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (_)=> MessageScreen(
              title: LocaleKeys.all_done.tr(),
              description: LocaleKeys.register_seller_message.tr(),
              onTap: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> AuthMethodsScreen()), (route) => false);
              },
            )), (route) => false);
        emit(RegisterInitial());
      }));
    }
  }

  _registerCustomer(BuildContext context) {
    emit(RegisterLoading());
    getIt<RegisterCustomerUseCase>()
        .call(
        username: usernameController.text.trim(),
        phoneNumber: formatPhoneNumber(phoneNumberController.text.trim()),
        password: passwordController.text
    )
        .then((value) => value.fold((error) {
              emit(RegisterError(error));
              showFlushBar(context,
                  title: "Error ${error.failureCode}", message: error.message);
              emit(RegisterInitial());
            }, (success) {
              emit(RegisterSuccess());
              _navigateToHomeScreen(context);
              emit(RegisterInitial());
            }));
  }

  _sendOtp(BuildContext context, RegisterType registerType) {
    emit(RegisterLoading());
    getIt<SendOtpUseCase>()
        .call(phoneNumberController.text)
        .then((value) => value.fold((error) {
              emit(RegisterError(error));
              showFlushBar(context,
                  title: "Error ${error.failureCode}", message: error.message);
              emit(RegisterInitial());
            }, (success) {
              emit(RegisterSuccess());
              _navigateToOtpScreen(context,registerType);
              emit(RegisterInitial());
            }));
  }

  _navigateToLoginScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  _navigateToRegisterMessageScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => MessageScreen(
                  title: LocaleKeys.all_done.tr(),
                  description: LocaleKeys.all_done_description.tr(),
                )));
  }

  _navigateToAuthMethodsScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const AuthMethodsScreen()),
        (route) => false);
  }

  _navigateToHomeScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> const HomeScreen()));
  }

  _navigateToSellerHomeScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => SellerHomeScreen()));
  }

  _navigateToOtpScreen(BuildContext context, RegisterType registerType) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => OtpScreen(
              phoneNumber: phoneNumberController.text,
                registerType : registerType
            )));
  }
}
