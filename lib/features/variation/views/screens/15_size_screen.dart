import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/cart/views/blocs/cart/cart_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/size/size_cubit.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_header.dart';
import '../../../../core/views/widgets/custom_progress_indicator.dart';
import '../../../../core/views/widgets/custom_text_field.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';

class SizeScreen extends StatelessWidget {
  const SizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: ListView(
          shrinkWrap: true,
          children: [

            Space(
              height: 2.h ,
            ),

            CustomHeader(title: LocaleKeys.cloth_size.tr(),),

            Space(
              height: 2.h,
            ),

            Text(
              LocaleKeys.length,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400, fontSize: 12.sp),
            ).tr(),
            Space(
              height: 0.5.h,
            ),

            Form(
              key: context.read<SizeCubit>().formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  CustomTextField(
                    keyboardType: TextInputType.number,
                    controller: context.read<SizeCubit>().lengthController,
                    validator: (_)=> context.read<SizeCubit>().validateField(_),

                    prefixIcon: Padding(
                      padding: EdgeInsets.all(3.w),
                      child: Image.asset(
                        AppImages.length,
                        width: 3.w,
                        height: 3.h,
                      ),
                    ),
                  ),

                  Space(
                    height: 1.h,
                  ),

                  Text(
                    LocaleKeys.shoulder,
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.neutral400, fontSize: 12.sp),
                  ).tr(),
                  Space(
                    height: 0.5.h,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    controller: context.read<SizeCubit>().shoulderController,
                    validator: (_)=> context.read<SizeCubit>().validateField(_),

                    prefixIcon: Padding(
                      padding: EdgeInsets.all(3.w),
                      child: Image.asset(
                        AppImages.shoulder,
                        width: 3.w,
                        height: 3.h,
                      ),

                    ),
                  ),

                  Space(
                    height: 1.h,
                  ),

                  Text(
                    LocaleKeys.sleeve,
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.neutral400, fontSize: 12.sp),
                  ).tr(),
                  Space(
                    height: 0.5.h,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    controller: context.read<SizeCubit>().sleevesController,
                    validator: (_)=> context.read<SizeCubit>().validateField(_),

                    prefixIcon: Padding(
                      padding: EdgeInsets.all(3.w),
                      child: Image.asset(
                        AppImages.sleeve,
                        width: 3.w,
                        height: 3.h,
                      ),

                    ),
                  ),

                  Space(
                    height: 1.h,
                  ),

                  Text(
                    LocaleKeys.chest,
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.neutral400, fontSize: 12.sp),
                  ).tr(),
                  Space(
                    height: 0.5.h,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    controller: context.read<SizeCubit>().chestController,
                    validator: (_)=> context.read<SizeCubit>().validateField(_),

                    prefixIcon: Padding(
                      padding: EdgeInsets.all(3.w),
                      child: Image.asset(
                        AppImages.chest,
                        width: 3.w,
                        height: 3.h,
                      ),

                    ),
                  ),

                  Space(
                    height: 1.h,
                  ),

                  Text(
                    LocaleKeys.neck,
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.neutral400, fontSize: 12.sp),
                  ).tr(),
                  Space(
                    height: 0.5.h,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    controller: context.read<SizeCubit>().neckController,
                    validator: (_)=> context.read<SizeCubit>().validateField(_),

                    prefixIcon: Padding(
                      padding: EdgeInsets.all(3.w),
                      child: Image.asset(
                        AppImages.neck,
                        width: 3.w,
                        height: 3.h,
                      ),

                    ),
                  ),

                  Space(
                    height: 1.h,
                  ),

                  Text(
                    LocaleKeys.hand,
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.neutral400, fontSize: 12.sp),
                  ).tr(),
                  Space(
                    height: 0.5.h,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    controller: context.read<SizeCubit>().handController,
                    validator: (_)=> context.read<SizeCubit>().validateField(_),

                    prefixIcon: Padding(
                      padding: EdgeInsets.all(3.w),
                      child: Image.asset(
                        AppImages.hand,
                        width: 3.w,
                        height: 3.h,
                      ),

                    ),
                  ),

                  Space(
                    height: 1.h,
                  ),

                  Text(
                    LocaleKeys.cuff,
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.neutral400, fontSize: 12.sp),
                  ).tr(),
                  Space(
                    height: 0.5.h,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    controller: context.read<SizeCubit>().cuffController,
                    validator: (_)=> context.read<SizeCubit>().validateField(_),

                    prefixIcon: Padding(
                      padding: EdgeInsets.all(3.w),
                      child: Image.asset(
                        AppImages.cuff,
                        width: 3.w,
                        height: 3.h,
                      ),

                    ),
                  ),



                  Space(
                    height: 5.h,
                  ),



                ],
              ),
            ),



          ],
        ),
      ),

      bottomNavigationBar: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding:  EdgeInsets.all(5.w),
            child: MainButton(
              color: AppTheme.primary900,
              width: 86.w,
              height: 6.5.h,
              label: (state is CartIsLoading)? CustomProgressIndicator(
                color: AppTheme.neutral100,
              ) : Text(
                "Add to cart",
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral100, fontSize: 13.sp),
              ).tr(),
              onTap: ()=> context.read<SizeCubit>().onAddToCartTap(context),
            ),
          );
        },
      ),
    ));
  }
}
