import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/auth/views/blocs/reset_password/reset_password_cubit.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_back_button.dart';
import '../../../../core/views/widgets/custom_text_field.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../utils/register_type.dart';

class ResetPasswordScreen extends StatelessWidget {
  RegisterType registerType;
  ResetPasswordScreen({super.key,required this.registerType});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: ListView(
          shrinkWrap: true,
          children: [

            Space(
              height: 2.h,
            ),

            CustomBackButton(),

            Space(
              height: 4.h,
            ),

            Text(
              LocaleKeys.reset_password,
              style: AppTheme.mainTextStyle(
                color: AppTheme.neutral900,
                fontSize: 25.sp,
              ),
            ).tr(),



            Space(
              height: 2.h,
            ),

            Text(
              LocaleKeys.reset_password_sub_text,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral900, fontSize: 12.sp),
            ).tr(),

            Space(
              height: 3.h,
            ),

            Text(
              LocaleKeys.phone_number,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400, fontSize: 12.sp),
            ).tr(),
            Space(
              height: 0.5.h,
            ),
            Form(
              key: context.read<ResetPasswordCubit>().formKey,
              child: CustomTextField(
                controller: context.read<ResetPasswordCubit>().phoneNumberController,
                validator: (_)=> context.read<ResetPasswordCubit>().validatePhone(),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(3.w),
                  child: SvgPicture.asset(
                    AppImages.phone,
                    width: 3.w,
                    height: 3.h,
                  ),

                ),
                hint: LocaleKeys.phone_number_hint.tr(),
              ),
            ),

            Space(
              height: 25.h,
            ),

            MainButton(
              color: AppTheme.primary900,
              width: 86.w,
              height: 6.5.h,
              label: Text(
                LocaleKeys.reset_password,
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral100, fontSize: 13.sp),
              ).tr(),
              onTap: () => context.read<ResetPasswordCubit>().onResetClick(context,registerType),
            ),
          ],
        ),
      ),
    ));
  }
}
