import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/core/core_feature/data/entities/citie_entity.dart';
import 'package:smart_soft/core/core_feature/domain/usecases/get_all_cities_use_case.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/order/domain/usecases/create_order_use_case.dart';
import 'package:smart_soft/features/variation/data/entities/get_all_sellers_response.dart';

import '../../../../../core/core_feature/data/entities/get_all_cities_response.dart';
import '../../../../../core/core_feature/domain/usecases/validate_phone_use_case.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../home/views/screens/06_home_screen.dart';
import '../../../data/entities/create_order_response.dart';
import '../../screens/payment_message_screen.dart';
import '../../screens/payment_methods_screen.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());


  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CityEntity? selectedCity;

  getAllCities(){
    emit(OrderIsLoading(citiesIsLoading: true));
    getIt<GetAllCitiesUseCase>().call().then((value) => value.fold(
            (error) {
              emit(OrderError(error));
            },
            (success) {
              emit(OrderSuccess(allCitiesResponse: success));
              selectedCity = OrderSuccess.allCitiesResponse!.obj![0];
            }
    ));
  }

  createOrder(BuildContext context){
    emit(OrderIsLoading(createOrderIsLoading: true));
    getIt<CreateOrderUseCase>().call(username: usernameController.text, phoneNumber: phoneNumberController.text, locationId: selectedCity!.id!).then((value) => value.fold(
            (error) {
          emit(OrderError(error));
        },
            (success) {
          emit(OrderSuccess(createOrderResponse: success));
          _navigateToPaymentMessageScreen(context);

            }
    ));
  }

  String? validateUsername(){
    if(usernameController.text.trim().isEmpty){
      return "please enter your name";
    }
  }

  OnCreateOrderTap(BuildContext context){

  }

  validatePhone(){
    return getIt<ValidatePhoneUseCase>().call(phoneNumberController.text);
  }

  onCustomerDetailsNextClick(BuildContext context) {
    createOrder(context);
  }

  onPaymentConfirmClick(BuildContext context) {
    _navigateToPaymentMessageScreen(context);
  }

  onPaymentMessageDoneClick(BuildContext context){
    _navigateToHomeScreen(context);
  }



  _navigateToPaymentMethodsScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=>  PaymentMethodsScreen()) );
  }

  _navigateToPaymentMessageScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=>  PaymentMessageScreen()) );
  }

  _navigateToHomeScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=>  HomeScreen()) );
  }

}
