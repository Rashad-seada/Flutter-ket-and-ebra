import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_images.dart';
import 'package:smart_soft/features/admin/admin_home/data/entities/get_admin_home_response.dart';
import 'package:smart_soft/features/admin/admin_home/views/bloc/seller_details/seller_details_cubit.dart';

import '../../../../../core/config/app_consts.dart';
import '../../../../../core/config/app_theme.dart';
import '../../../../../core/views/widgets/custom_back_button.dart';
import '../../../../../core/views/widgets/custom_network_image.dart';
import '../../../../../core/views/widgets/custom_progress_indicator.dart';
import '../../../../../core/views/widgets/main_button.dart';
import '../../../../../core/views/widgets/space.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../components/pending_seller_card.dart';

class SellerDetailsScreen extends StatelessWidget {
  ReturnListofReq seller;
  SellerDetailsScreen({super.key,required this.seller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        children: [

          Space(
            height: 2.h,
          ),
          CustomBackButton(),

          Space(
            height: 3.h,
          ),

          Text(
            LocaleKeys.tailor_details,
            style: AppTheme.mainTextStyle(
              color: AppTheme.neutral900,
              fontSize: 20.sp,
            ),
          ).tr(),

          Space(
            height: 4.h,
          ),

          Container(
            padding: EdgeInsets.all(7.w),
            width: 35.w,
            height: 35.w,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.neutral200
            ),
            child: SvgPicture.asset(AppImages.profile),
          ),
          Space(
            height: 4.h,
          ),
          Row(
            children: [
              Text(
                LocaleKeys.username + " : ",
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral900, fontSize: 16.sp),
              ),

              Text(
                seller.name.toString(),
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral400, fontSize: 14.sp),
              ),
            ],
          ),
          Space(
            height: 2.h,
          ),
          Row(
            children: [

              Text(
                LocaleKeys.phone_number.tr() + " : ",
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral900, fontSize: 16.sp),
              ),
              Text(
                seller.phoneNumber.toString(),
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral400, fontSize: 14.sp),
              ),
            ],
          ),
          Space(
            height: 2.h,
          ),
          Row(
            children: [

              Text(
                LocaleKeys.trade_register.tr() + " : ",
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral900, fontSize: 16.sp),
              ),
              Text(
                seller.comNo.toString(),
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral400, fontSize: 14.sp),
              ),
            ],
          ),
          Space(
            height: 2.h,
          ),
          Row(
            children: [

              Text(
                LocaleKeys.tax_id_number.tr() + " : ",
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral900, fontSize: 16.sp),
              ),

              Text(
                seller.taxNo.toString(),
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral400, fontSize: 14.sp),
              ),
            ],
          ),
          Space(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocConsumer<SellerDetailsCubit, SellerDetailsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return MainButton(
                    color: AppTheme.success,
                    width: 41.w,
                    height: 5.5.h,
                    label: (state is SellerDetailsAcceptIsLoading)? CustomProgressIndicator(
                      color: AppTheme.neutral100,
                    ) : Text(
                      LocaleKeys.accept,
                      style: AppTheme.mainTextStyle(
                          color: AppTheme.neutral100, fontSize: 13.sp),
                    ).tr(),
                    onTap: ()=> context.read<SellerDetailsCubit>().onAcceptTap(context,seller.id ?? -1),
                  );
                },
              ),



              BlocConsumer<SellerDetailsCubit, SellerDetailsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return MainButton(
                    color: AppTheme.error,
                    width: 41.w,
                    height: 5.5.h,
                    label: (state is SellerDetailsRejectIsLoading)? CustomProgressIndicator(
                      color: AppTheme.neutral100,
                    ) : Text(
                      LocaleKeys.reject,
                      style: AppTheme.mainTextStyle(
                          color: AppTheme.neutral100, fontSize: 13.sp),
                    ).tr(),
                    onTap: ()=> context.read<SellerDetailsCubit>().onRejectTap(context,seller.id ?? -1),
                  );
                },
              ),
            ],
          ),

        ],
      ),
    ));
  }
}
