import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/views/widgets/custom_checkbox.dart';
import 'package:smart_soft/core/views/widgets/custom_progress_indicator.dart';
import 'package:smart_soft/core/views/widgets/custom_text_field.dart';
import 'package:smart_soft/features/auth/views/blocs/login/login_cubit.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_back_button.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../utils/register_type.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: ListView(
          children: [

            Space(
              height: 2.h,
            ),

            CustomBackButton(),

            Space(
              height: 4.h,
            ),

            Text(
              LocaleKeys.login,
              style: AppTheme.mainTextStyle(
                color: AppTheme.neutral900,
                fontSize: 25.sp,
              ),
            ).tr(),
            Space(
              height: 2.h,
            ),
            Text(
              LocaleKeys.login_description,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral900, fontSize: 12.sp),
            ).tr(),

            Space(
              height: 3.h,
            ),


            Form(
              key: context.read<LoginCubit>().formKey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.phone_number,
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral400, fontSize: 12.sp),
                ).tr(),
                Space(
                  height: 0.5.h,
                ),
                CustomTextField(
                  controller: context.read<LoginCubit>().phoneNumberController,
                  validator: (_)=> context.read<LoginCubit>().validatePhone(),

                  prefixIcon: Padding(
                    padding: EdgeInsets.all(3.w),
                    child: SvgPicture.asset(
                      AppImages.phone,
                      width: 3.w,
                      height: 3.h,
                    ),

                  ),
                  keyboardType: TextInputType.number,
                  hint: LocaleKeys.phone_number_hint.tr(),
                ),
                Space(
                  height: 1.h,
                ),

                Text(
                  LocaleKeys.password,
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral400, fontSize: 12.sp),
                ).tr(),
                Space(
                  height: 0.5.h,
                ),
                CustomTextField(
                  controller: context.read<LoginCubit>().passwordController,
                  validator: (_)=> context.read<LoginCubit>().validatePassword(),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(3.w),
                    child: SvgPicture.asset(
                      AppImages.password,
                      width: 3.w,
                      height: 3.h,
                    ),

                  ),
                  hint: LocaleKeys.password_hint.tr(),
                  isSecure: true
                ),
              ],
            )),


            Space(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                CustomCheckBox(
                    value: context.read<LoginCubit>().rememberMe,
                    onChanged: (value){
                      context.read<LoginCubit>().rememberMe = value!;
                    },
                  label: LocaleKeys.remember_me.tr(),
                ),

                InkWell(
                  onTap: () => context.read<LoginCubit>().onForgotPasswordClick(context,RegisterType.RegisterCustomer) ,
                  child: Text(
                    LocaleKeys.forgot_password.tr(),
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.primary900, fontSize: 12.sp),
                  ).tr(),
                ),
              ],
            ),

            Space(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text(
                  LocaleKeys.dont_have_account.tr(),
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral400, fontSize: 12.sp),
                ).tr(),
                Space(
                  width: 2.w,
                ),
                InkWell(
                  onTap: () => context.read<LoginCubit>().onRegisterClick(context),
                  child: Text(
                    LocaleKeys.register.tr(),
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.primary900, fontSize: 12.sp),
                  ).tr(),
                ),
              ],
            ),

            Space(
              height: 2.h,
            ),

            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {},
              builder: (context, state) {
                return MainButton(
                          color: AppTheme.primary900,
                          width: 86.w,
                          height: 6.5.h,
                          label: (state is LoginLoading)? CustomProgressIndicator(
                            color: AppTheme.neutral100,
                          ) : Text(
                            LocaleKeys.login,
                            style: AppTheme.mainTextStyle(
                                color: AppTheme.neutral100, fontSize: 13.sp),
                          ).tr(),
                          onTap: ()=> context.read<LoginCubit>().onLoginClick(context),
                        );
              },
            ),

            Space(
              height: 5.h,
            ),

            Center(
              child: Text(
                LocaleKeys.our_terms,
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral400, fontSize: 10.sp,),
                  textAlign: TextAlign.center
              ).tr(),
            ),

            Space(
              height: 2.h,
            ),


          ],
        ),
      ),

    ));
  }
}
