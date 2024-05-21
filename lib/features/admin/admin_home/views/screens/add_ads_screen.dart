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
import '../../../../seller/add_variation/views/components/image_picker_component.dart';
import '../bloc/add_ads/add_ads_cubit.dart';
import '../bloc/home_ads/home_ads_cubit.dart';


class AddAdsScreen extends StatelessWidget {
  AddAdsScreen({super.key});


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
                title: LocaleKeys.home_ads.tr(),
                showCart: false,
              ),
            ),

            Space(
              height: 3.h,
            ),

            BlocConsumer<AddAdsCubit, AddAdsState>(
              listener: (context, state) {
              },
              builder: (context, state) {
                return ImagePickerComponent(
                          image: context.read<AddAdsCubit>().selectedImage ,
                          onTap: ()=> context.read<AddAdsCubit>().onImageSelectionTap(),
                          onDeleteTap: ()=> context.read<AddAdsCubit>().onImageRemoveTap(),
                        );
              },
            ),

            Space(
              height: 3.h,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: Form(
                  key: context.read<AddAdsCubit>().formKey,
                  child: Column(
                children: [


                    CustomTextField(
                      controller: context.read<AddAdsCubit>().descriptionController,
                      validator: (_)=> context.read<AddAdsCubit>().validateDescription(),
                      label: LocaleKeys.description.tr(),
                    ),

                ],
              ) ),
            ),

            Space(
              height: 3.h,
            ),


            BlocConsumer<AddAdsCubit, AddAdsState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: MainButton(
                    color: AppTheme.primary900,
                    width: 86.w,
                    height: 6.5.h,
                    label: (state is AddAdsIsLoading)? CustomProgressIndicator(
                      color: AppTheme.neutral100,
                    ) : Text(
                      LocaleKeys.add,
                      style: AppTheme.mainTextStyle(
                          color: AppTheme.neutral100, fontSize: 13.sp),
                    ).tr(),
                    onTap: ()=> context.read<AddAdsCubit>().onAddClick(
                        context,
                        ()=> context.read<HomeAdsCubit>().getHomeAds()
                    ),
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
