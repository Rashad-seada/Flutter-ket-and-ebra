import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/seller/add_variation/domain/usecase/create_button_use_case.dart';
import 'package:smart_soft/features/seller/add_variation/domain/usecase/create_chest_use_case.dart';
import 'package:smart_soft/features/seller/add_variation/domain/usecase/create_collar_use_case.dart';
import 'package:smart_soft/features/seller/add_variation/domain/usecase/create_embroidery_use_case.dart';
import 'package:smart_soft/features/seller/add_variation/domain/usecase/create_fabric_use_case.dart';
import 'package:smart_soft/features/seller/add_variation/domain/usecase/create_front_pocket_use_case.dart';
import 'package:smart_soft/features/seller/add_variation/domain/usecase/create_sleeve_use_case.dart';
import 'package:smart_soft/features/seller/seller_variations/views/utils/variations_enum.dart';

import '../../../../../../core/infrastructure/services/image_picker_service.dart';
import '../../../../../../core/views/widgets/custom_flush_bar.dart';

part 'add_variation_state.dart';

class AddVariationCubit extends Cubit<AddVariationState> {
  AddVariationCubit() : super(AddVariationInitial());

  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  XFile? selectedImage;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  void clear() {
    selectedImage = null;
    nameController.text = '';
    descriptionController.text = '';
    priceController.text = '';
  }

  onImageSelectionTap() async {
    emit(AddVariationSelectingImage());
    selectedImage = await getIt<ImagePickerService>().pickImageFromGallery();
    emit(AddVariationInitial());
  }

  String? validateDescription() {
    if(descriptionController.text.isEmpty){
      return "this field is required";
    }
  }

  validatePrice() {
    if(descriptionController.text.isEmpty){
      return "this field is required";
    }
  }

  validateName() {
    if(descriptionController.text.isEmpty){
      return "this field is required";
    }
  }

  onImageRemoveTap() {
    emit(AddVariationSelectingImage());
    selectedImage = null;
    emit(AddVariationInitial());
  }

  Future<void> onAddClick(BuildContext context, VariationsEnum variationsEnum) async {

    if(selectedImage == null) {
      showFlushBar(
          context,
          title: "Validation error",
          message : "Please select an image for your variant"
      );

    } else if(formKey.currentState!.validate() ){
      await addVariant(context,variationsEnum);

    }

  }

  addVariant(BuildContext context, VariationsEnum variationsEnum) async {
    switch(variationsEnum){
      case VariationsEnum.Fabric:
        return createFabric(context);

      case VariationsEnum.Collar:
        return createCollar(context);

      case VariationsEnum.FrontPocket:
        return createFrontPocket(context);

      case VariationsEnum.Chest:
        return createChest(context);

      case VariationsEnum.Sleeve:
        return createSleeve(context);

      case VariationsEnum.Button:
        return createButton(context);

      case VariationsEnum.Embroidery:
        return createEmbroidery(context);

    };
  }

  createButton(BuildContext context){
    emit(AddVariationIsLoading());
    getIt<CreateButtonUseCase>().call(title: nameController.text, description: nameController.text,image: selectedImage, price: double.tryParse(priceController.text) ?? 0 )
        .then((value) => value.fold(
        (error) {
          showFlushBar(
              context,
              title: "Error ${error.failureCode}",
              message : error.message
          );
          emit(AddVariationError());

        },
            (success) {
              Navigator.pop(context);
              emit(AddVariationSuccess());
            })
    );
  }

  createChest(BuildContext context){
    emit(AddVariationIsLoading());
    getIt<CreateChestUseCase>().call(title: nameController.text, description: nameController.text,image: selectedImage )
        .then((value) => value.fold(
            (error) {
          showFlushBar(
              context,
              title: "Error ${error.failureCode}",
              message : error.message
          );
          emit(AddVariationError());

            },
            (success) {
              Navigator.pop(context);
              emit(AddVariationSuccess());
            })
    );
  }

  createCollar(BuildContext context){
    emit(AddVariationIsLoading());
    getIt<CreateCollarUseCase>().call(title: nameController.text, description: nameController.text,image: selectedImage )
        .then((value) => value.fold(
            (error) {
          showFlushBar(
              context,
              title: "Error ${error.failureCode}",
              message : error.message
          );
          emit(AddVariationError());

        },
        (success) {
          Navigator.pop(context);
          emit(AddVariationSuccess());

        }
    )
    );
  }

  createEmbroidery(BuildContext context){
    emit(AddVariationIsLoading());
    getIt<CreateEmbroideryUseCase>().call(title: nameController.text, description: nameController.text,image: selectedImage, price: double.tryParse(priceController.text) ?? 0 )
        .then((value) => value.fold(
            (error) {
              showFlushBar(
                  context,
                  title: "Error ${error.failureCode}",
                  message : error.message
              );
              emit(AddVariationError());

            },
            (success) {
              Navigator.pop(context);
              emit(AddVariationSuccess());
            })
    );
  }

  createFabric(BuildContext context){
    emit(AddVariationIsLoading());
    getIt<CreateFabricUseCase>().call(title: nameController.text, description: nameController.text,image: selectedImage, price: double.tryParse(priceController.text) ?? 0.0 )
        .then((value) => value.fold(
            (error) {
          showFlushBar(
              context,
              title: "Error ${error.failureCode}",
              message : error.message
          );
          emit(AddVariationError());

            },
            (success) {
              Navigator.pop(context);
              emit(AddVariationSuccess());
            })
    );
  }

  createFrontPocket(BuildContext context){
    emit(AddVariationIsLoading());
    getIt<CreateFrontPocketUseCase>().call(title: nameController.text, description: nameController.text,image: selectedImage )
        .then((value) => value.fold(
            (error) {
          showFlushBar(
              context,
              title: "Error ${error.failureCode}",
              message : error.message
          );
          emit(AddVariationError());

            },
            (success) {
              Navigator.pop(context);
              emit(AddVariationSuccess());
            })
    );
  }

  createSleeve(BuildContext context){
    emit(AddVariationIsLoading());
    getIt<CreateSleeveUseCase>().call(title: nameController.text, description: nameController.text,image: selectedImage )
        .then((value) => value.fold(
            (error) {
          showFlushBar(
              context,
              title: "Error ${error.failureCode}",
              message : error.message
          );
          emit(AddVariationError());

    },
    (success) {
      Navigator.pop(context);
      emit(AddVariationSuccess());
    })
    );
  }




}
