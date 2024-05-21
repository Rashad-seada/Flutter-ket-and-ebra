import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/admin/admin_home/data/entities/get_admin_home_response.dart';

import '../../../../../core/config/app_theme.dart';
import '../../../../../core/views/widgets/custom_back_button.dart';
import '../../../../../core/views/widgets/custom_error_component.dart';
import '../../../../../core/views/widgets/custom_progress_indicator.dart';
import '../../../../../core/views/widgets/space.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../bloc/admin_home/admin_home_cubit.dart';
import '../components/pending_seller_card.dart';

class PendingSellerScreen extends StatelessWidget {
  List<ReturnListofReq> list;

  PendingSellerScreen({super.key, required this.list});

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
                LocaleKeys.pending_seller,
                style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral900,
                  fontSize: 20.sp,
                ),
              ).tr(),

              Space(
                height: 2.h,
              ),

              BlocConsumer<AdminHomeCubit, AdminHomeState>(
                builder: (context, state) {
                  if(state is AdminHomeIsLoading){
                    return CustomProgressIndicator();

                  } else if(state is AdminHomeError){
                    return CustomErrorComponent(
                      errorMessage: AdminHomeError.failure.message,
                      onTap: ()=> context.read<AdminHomeCubit>().getAdminHome(),
                    );

                  } else {
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: AdminHomeSuccess.adminHome?.obj?.returnListofReq?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return PendingSellerCard(seller: AdminHomeSuccess.adminHome!.obj!.returnListofReq![index]);
                      }
                  );}
                }, listener: (BuildContext context, AdminHomeState state) {  },
              )
            ],
          ),
        ));
  }
}
