import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';

import '../../../../../core/config/app_consts.dart';
import '../../../../../core/config/app_images.dart';
import '../../../../../core/config/app_theme.dart';
import '../../../../../core/views/widgets/custom_header.dart';
import '../../../../../core/views/widgets/custom_network_image.dart';
import '../../../../../core/views/widgets/custom_progress_indicator.dart';
import '../../../../../core/views/widgets/custom_text_field.dart';
import '../../../../../core/views/widgets/main_button.dart';
import '../../../../../core/views/widgets/space.dart';
import '../blocs/seller/seller_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    context.read<SellerCubit>().getSeller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [

          Space(
            height: 2.h,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.5.w),
            child: CustomHeader(
              title: LocaleKeys.profile.tr(),
              showCart: false,
            ),
          ),

          Space(
            height: 6.h,
          ),

          BlocBuilder<SellerCubit, SellerState>(
            builder: (context, state) {


              if(state is SellerIsLoading){
                return CustomProgressIndicator();

              }else if(state is SellerError){
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(SellerError.failure.message),
                );

              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal : 7.w),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: ()=> context.read<SellerCubit>().onImageTap(context),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppTheme.neutral200
                              ),
                              child: CustomNetworkImage(
                                  height: 35.w,
                                  width: 35.w,
                                  url:
                                  AppConsts.imgUrl + (SellerSuccess.sellerResponse?.obj?.profileImg ?? "")
                              ),
                            ),


                            Container(
                              clipBehavior: Clip.hardEdge,
                              padding: EdgeInsets.all(2.w),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppTheme.neutral300
                              ),
                              child: Icon(Icons.edit)
                            ),

                          ],
                        ),
                      ),

                      Space(
                        height: 5.h,
                      ),



                      CustomTextField(
                        controller: context.read<SellerCubit>().usernameController,
                        validator: (_)=> context.read<SellerCubit>().validatePhone(),

                        prefixIcon: Padding(
                          padding: EdgeInsets.all(3.w),
                          child: SvgPicture.asset(
                            AppImages.profile,
                            width: 3.w,
                            height: 3.h,
                          ),

                        ),
                        hint: LocaleKeys.username_hint.tr(),
                      ),
                      Space(
                        height: 3.h,
                      ),

                      CustomTextField(
                        enabled: false,
                        controller: context.read<SellerCubit>().phoneNumberController,
                        validator: (_)=> context.read<SellerCubit>().validateUsername(),

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
                      Space(
                        height: 30.h,
                      ),

                      MainButton(
                        color: AppTheme.primary900,
                        width: 86.w,
                        height: 6.5.h,
                        label: (state is SellerIsSaving)? CustomProgressIndicator(
                          color: AppTheme.neutral100,
                        ) : Text(
                          LocaleKeys.done,
                          style: AppTheme.mainTextStyle(
                              color: AppTheme.neutral100, fontSize: 13.sp),
                        ).tr(),
                        onTap: ()=> context.read<SellerCubit>().onSaveTap(context),
                      ),

                    ],
                  ),
                );
              }
            },
          ),


        ],
      ),
    ));
  }
}
