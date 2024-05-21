import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';
import 'package:smart_soft/core/views/widgets/custom_error_component.dart';
import 'package:smart_soft/core/views/widgets/custom_progress_indicator.dart';
import 'package:smart_soft/features/admin/admin_home/views/bloc/admin_home/admin_home_cubit.dart';

import '../../../../../core/config/app_images.dart';
import '../../../../../core/views/widgets/space.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../home/views/components/home_appbar.dart';
import '../components/admin_drawer.dart';
import '../components/dashboard_card.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {

  @override
  void initState() {
    context.read<AdminHomeCubit>().getAdminHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          key: context
              .read<AdminHomeCubit>()
              .scaffoldKey,
          drawer: const AdminDrawer(),
          body: RefreshIndicator(
            color: AppTheme.primary900,
            onRefresh: () async {
              context.read<AdminHomeCubit>().getAdminHome();

            },
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal : 7.w),
              children: [
                Space(
                  height: 2.h,
                ),
                HomeAppBar(
                  title: LocaleKeys.dashboard.tr(),
                  trailingIcon: AppImages.menu,
                  onTrailingIconTap: () =>
                      context.read<AdminHomeCubit>().openDrawer(),
                  leadingIcon: "",
                  onLeadingIconTap: () {},
                ),
                Space(
                  height: 3.h,
                ),

                BlocConsumer<AdminHomeCubit,AdminHomeState>(
                  listener: (context, state) {},
                  builder: (context, state) {

                    if(state is AdminHomeIsLoading){
                      return CustomProgressIndicator();

                    } else if(state is AdminHomeError){
                      return CustomErrorComponent(
                          errorMessage: AdminHomeError.failure.message,
                          onTap: ()=> context.read<AdminHomeCubit>().getAdminHome(),
                      );

                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "${LocaleKeys.welcome_back.tr()} 👋",
                            style: AppTheme.mainTextStyle(
                                color: AppTheme.neutral900, fontSize: 20.sp),
                          ),
                          Space(
                            height: 3.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DashboardCard(
                                color: AppTheme.green,
                                label: LocaleKeys.pending_seller.tr(),
                                count: (AdminHomeSuccess.adminHome?.obj?.returnListofReq?.length ?? 0).toString(),
                                subText: LocaleKeys.pending_seller_request_sub_text.tr(),
                                onTap: () =>
                                    context.read<AdminHomeCubit>()
                                        .onPendingSellerRequestClick(context,AdminHomeSuccess.adminHome?.obj?.returnListofReq ?? []),
                              ),
                              DashboardCard(
                                color: AppTheme.red,
                                label: LocaleKeys.new_user.tr(),
                                count: (AdminHomeSuccess.adminHome?.obj?.listtoReturnUser?.length ?? 0).toString(),
                                subText: LocaleKeys.new_user_sub_text.tr(),
                              ),
                            ],
                          ),
                          Space(
                            height: 2.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DashboardCard(
                                color: AppTheme.yellow,
                                label: LocaleKeys.monthly_income.tr(),
                                count: '${(AdminHomeSuccess.adminHome?.obj?.totalSales ?? 0).toString()} \$',
                                subText: LocaleKeys.monthly_income_sub_text.tr(),
                              ),
                              DashboardCard(
                                color: AppTheme.blue,
                                label: LocaleKeys.new_seller.tr(),
                                count: (AdminHomeSuccess.adminHome?.obj?.returnSeller?.length ?? 0).toString(),
                                subText: LocaleKeys.new_seller_sub_text.tr(),
                              ),
                            ],
                          ),
                          Space(
                            height: 2.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DashboardCard(
                                color: AppTheme.red
                                ,
                                label: LocaleKeys.home_ads.tr(),
                                count: '',
                                subText: LocaleKeys.home_ads_sub_text.tr(),
                                onTap: ()=> context.read<AdminHomeCubit>().onHomeAdsTap(context),
                              ),

                            ],
                          )

                        ],
                      );
                    }

                  },
                ),



              ],
            ),
          ),
        ));
  }
}
