import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/core/infrastructure/services/image_picker_service.dart';
import 'package:smart_soft/features/admin/admin_home/domain/usecases/set_home_ads_by_admin_use_case.dart';
import 'package:smart_soft/features/home/domain/usecases/set_home_ads_use_case.dart';

import '../../../../../../core/views/widgets/custom_flush_bar.dart';

part 'add_ads_state.dart';

class AddAdsCubit extends Cubit<AddAdsState> {
  AddAdsCubit() : super(AddAdsInitial());

  XFile? selectedImage;
  TextEditingController descriptionController = TextEditingController();
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  onAddClick(BuildContext context,void Function() callBack) {
    if(formKey.currentState!.validate() && selectedImage != null){
      emit(AddAdsIsLoading());
      getIt<SetHomeAdsByAdminUseCase>().call(sellerId: null, description: descriptionController.text, image: selectedImage!).then((value) => value.fold(
          (error) {
            showFlushBar(
                context,
                title: "Error ${error.failureCode}",
                message : error.message
            );
            emit(AddAdsError());

          },
          (success) {

            Navigator.pop(context);
            emit(AddAdsSuccess());

            callBack();
          }
      ));
    }
  }

  onImageSelectionTap() async {
    emit(AddAdsImageChanging());
    selectedImage = await getIt<ImagePickerService>().pickImageFromGallery();
    emit(AddAdsInitial());
  }

  onImageRemoveTap() {
    emit(AddAdsImageChanging());
    selectedImage = null;
    emit(AddAdsInitial());
  }

  String? validateDescription() {
    if(descriptionController.text.isEmpty){
      return "This field is required";
    }

  }

}
