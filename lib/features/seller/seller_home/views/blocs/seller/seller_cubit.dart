import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/core/config/app_consts.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/core/infrastructure/services/image_picker_service.dart';
import 'package:smart_soft/features/seller/seller_home/domain/usecases/get_seller_by_id_use_case.dart';
import 'package:smart_soft/features/seller/seller_home/domain/usecases/update_seller_details_use_case.dart';
import 'package:smart_soft/features/seller/seller_home/domain/usecases/upload_seller_image_use_case.dart';

import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/views/widgets/custom_flush_bar.dart';
import '../../../data/entities/get_one_seller_response.dart';

part 'seller_state.dart';

class SellerCubit extends Cubit<SellerState> {
  SellerCubit() : super(SellerInitial());


  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  XFile? image;

  getSeller(){
    emit(SellerIsLoading());
    getIt<GetSellerByIdUseCase>().call().then(
            (value) => value.fold(
                    (error) {
                      emit(SellerError(error));
                    },
                    (success) {
                      emit(SellerSuccess(success));
                      usernameController.text = success.obj?.userName ?? '';

                      phoneNumberController.text = success.obj?.phoneNumber ?? '';

                      print( AppConsts.imgUrl + (success.obj?.profileImg ?? ""));
                    }
            ));
  }

  onSaveTap(BuildContext context) {
    emit(SellerIsSaving());
    getIt<UpdateSellerDetailsUseCase>().call(username: usernameController.text).then(
            (value) => value.fold(
                    (error) {
                      showFlushBar(
                          context,
                          title: "Error ${error.failureCode}",
                          message : error.message
                      );
                      emit(SellerInitial());
                      print("error");
                    },
                    (success) {
                      emit(SellerInitial());
                      print("success");

                    }
            ));
  }

  String? validatePhone() {
    if(phoneNumberController.text.isEmpty){
      return "You must enter a phone number";
    }
  }

  String? validateUsername() {
    if(usernameController.text.isEmpty){
      return "You must enter a username";
    }
  }

  onImageTap(BuildContext context) async {
    image = await getIt<ImagePickerService>().pickImageFromGallery();
    if(image != null) {
      await getIt<UploadSellerImageUseCase>().call(image: image!).then(
              (value) => value.fold(
              (error) {
                showFlushBar(
                    context,
                    title: "Error ${error.failureCode}",
                    message : error.message
                );
                emit(SellerInitial());
                print("error");
              },
              (success) async {
                emit(SellerInitial());
                await getSeller();
              }
          ));
    }
  }


}
