import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/config/app_theme.dart';
import '../../../../../core/views/widgets/custom_header.dart';
import '../../../../../core/views/widgets/custom_progress_indicator.dart';
import '../../../../../core/views/widgets/custom_text_field.dart';
import '../../../../../core/views/widgets/main_button.dart';
import '../../../../../core/views/widgets/space.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../seller_variations/views/utils/variations_enum.dart';
import '../bloc/add_variation/add_variation_cubit.dart';
import '../components/image_picker_component.dart';

class AddVariationScreen extends StatefulWidget {
  VariationsEnum variationsEnum;
  AddVariationScreen({super.key,required this.variationsEnum});

  @override
  State<AddVariationScreen> createState() => _AddVariationScreenState();
}

class _AddVariationScreenState extends State<AddVariationScreen> {
  String getLabel(){
    switch(widget.variationsEnum){
      case VariationsEnum.Fabric:
        return "${LocaleKeys.add.tr()} ${LocaleKeys.fabric.tr()}";

      case VariationsEnum.Collar:
        return "${LocaleKeys.add.tr()} ${LocaleKeys.collar.tr()}";

      case VariationsEnum.FrontPocket:
        return "${LocaleKeys.add.tr()} ${LocaleKeys.front_pocket.tr()}";

      case VariationsEnum.Chest:
        return "${LocaleKeys.add.tr()} ${LocaleKeys.chest.tr()}";

      case VariationsEnum.Sleeve:
        return "${LocaleKeys.add.tr()} ${LocaleKeys.sleeve.tr()}";

      case VariationsEnum.Button:
        return "${LocaleKeys.add.tr()} ${LocaleKeys.button.tr()}";

      case VariationsEnum.Embroidery:
        return "${LocaleKeys.add.tr()} ${LocaleKeys.embroidery.tr()}";

    }
  }

  @override
  void initState() {
    context.read<AddVariationCubit>().clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
          body: ListView(
          shrinkWrap: true,
          children: [

            Space(
              height: 2.h,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.5.w),
              child: CustomHeader(
                title: getLabel(),
                showCart: false,
              ),
            ),

            Space(
              height: 3.h,
            ),

            BlocConsumer<AddVariationCubit, AddVariationState>(
              listener: (context, state) {
              },
              builder: (context, state) {
                return ImagePickerComponent(
                  image: context.read<AddVariationCubit>().selectedImage ,
                  onTap: ()=> context.read<AddVariationCubit>().onImageSelectionTap(),
                  onDeleteTap: ()=> context.read<AddVariationCubit>().onImageRemoveTap(),
                );
              },
            ),

            Space(
              height: 3.h,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: Form(
                  key: context.read<AddVariationCubit>().formKey,
                  child: Column(
                children: [

                  CustomTextField(
                    controller: context.read<AddVariationCubit>().nameController,
                    validator: (_)=> context.read<AddVariationCubit>().validateName(),
                    label: LocaleKeys.name.tr(),
                  ),

                  Space(
                    height: 2.h,
                  ),
                  CustomTextField(
                    controller: context.read<AddVariationCubit>().descriptionController,
                    validator: (_)=> context.read<AddVariationCubit>().validateDescription(),
                    label: LocaleKeys.description.tr(),
                  ),
                  Space(
                    height: 2.h,
                  ),

                  if(widget.variationsEnum == VariationsEnum.Fabric || widget.variationsEnum == VariationsEnum.Embroidery || widget.variationsEnum == VariationsEnum.Button )
                  CustomTextField(
                    controller: context.read<AddVariationCubit>().priceController,
                    validator: (_)=> context.read<AddVariationCubit>().validatePrice(),
                    label: LocaleKeys.price.tr(),
                  ),

                ],
              ) ),
            ),

            Space(
              height: 3.h,
            ),


            BlocConsumer<AddVariationCubit, AddVariationState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: MainButton(
                    color: AppTheme.primary900,
                    width: 86.w,
                    height: 6.5.h,
                    label: (state is AddVariationIsLoading)? CustomProgressIndicator(
                      color: AppTheme.neutral100,
                    ) : Text(
                      LocaleKeys.add,
                      style: AppTheme.mainTextStyle(
                          color: AppTheme.neutral100, fontSize: 13.sp),
                    ).tr(),
                    onTap: ()=> context.read<AddVariationCubit>().onAddClick(context,widget.variationsEnum),
                  ),
                );
              },
            ),

            Space(
              height: 3.h,
            ),


          ],
      ),
    ));
  }
}
