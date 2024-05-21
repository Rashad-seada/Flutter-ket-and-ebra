import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';
import 'package:smart_soft/core/views/widgets/custom_network_image.dart';
import 'package:smart_soft/core/views/widgets/space.dart';
import 'package:smart_soft/features/admin/admin_home/views/bloc/admin_home/admin_home_cubit.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';

import '../../../../../core/config/app_images.dart';
import '../../../../home/views/bloc/home/home_cubit.dart';
import '../../../../seller/seller_home/views/blocs/seller_home/seller_home_cubit.dart';


class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          Space(
            height: 2.h,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: ()=> context.read<AdminHomeCubit>().closeDrawer(context),
                  child: SvgPicture.asset(
                    fit: BoxFit.fitWidth,
                    AppImages.close,
                    width: 6.w,
                    height: 6.w,
                  ),
                ),
              ],
            ),
          ),

          Space(
            height: 2.h,
          ),

          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                shape: BoxShape.circle
            ),
            child: Image.asset(
              AppImages.authMethods,
              height: 30.w,
              width: 30.w,

            ),
          ),



          Space(
            height: 3.h,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Divider(
              color: AppTheme.neutral200,
            ),
          ),

          Space(
            height: 3.h,
          ),

          InkWell(
            onTap: ()=> context.read<HomeCubit>().onLogoutTap(context),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                children: [

                  Icon(
                    Icons.logout,
                    size: 6.w,
                    color: AppTheme.neutral900,
                  ),
                  Space(
                    width: 3.w,
                  ),

                  Text(
                    "Logout",
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.neutral900, fontSize: 13.sp),
                  ).tr(),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
