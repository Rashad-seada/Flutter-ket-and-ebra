import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_images.dart';
import 'package:smart_soft/core/views/widgets/custom_divider.dart';
import 'package:smart_soft/core/views/widgets/custom_progress_indicator.dart';
import 'package:smart_soft/core/views/widgets/space.dart';
import 'package:smart_soft/features/auth/utils/register_type.dart';
import 'package:smart_soft/features/auth/views/screens/01_login_screen.dart';
import 'package:smart_soft/features/auth/views/screens/02_register_screen.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';

import '../../../../core/bloc/core_cubit.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../admin/admin_home/views/screens/admin_home_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  @override
  void initState() {
    context.read<CoreCubit>().getUser(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Space(
              height: 4.h,
            ),

            Center(
              child: Image.asset(
                AppImages.authMethods,
                width: 86.w,
                height: 23.h,
              ),
            ),

            Space(
              height: 3.h,
            ),

            CustomProgressIndicator()
          ],
        ),
      ),
    ));
  }
}
