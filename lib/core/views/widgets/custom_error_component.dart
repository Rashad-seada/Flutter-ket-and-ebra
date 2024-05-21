import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';
import 'package:smart_soft/core/views/widgets/space.dart';

import '../../../generated/locale_keys.g.dart';
import 'main_button.dart';

class CustomErrorComponent extends StatelessWidget {
  String errorMessage;
  void Function()? onTap;

  CustomErrorComponent({super.key, required this.errorMessage, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Space(
          height: 15.h,
        ),

        Icon(
          Icons.do_not_disturb_alt_outlined,
          size: 40.w,
          color: AppTheme.neutral300,
        ),
        Space(
          height: 5.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(errorMessage,textAlign: TextAlign.center,),
        ),
        Space(
          height: 5.h,
        ),
        MainButton(
          color: AppTheme.primary900,
          width: 50.w,
          height: 6.5.h,
          label: Text(
            "اعد المحاوله",
            style: AppTheme.mainTextStyle(
                color: AppTheme.neutral100, fontSize: 13.sp),
          ).tr(),
          onTap: onTap,
        )
      ],
    );
  }
}
