import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_images.dart';
import 'package:smart_soft/core/views/widgets/custom_progress_indicator.dart';
import 'package:smart_soft/features/home/views/bloc/home/home_cubit.dart';
import 'package:smart_soft/features/home/views/components/customer_drawer.dart';
import 'package:smart_soft/features/home/views/components/home_card.dart';

import '../../../../core/config/app_consts.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_error_component.dart';
import '../../../../core/views/widgets/custom_page_indicator.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../components/home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    context.read<HomeCubit>().getHomeAds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context
          .read<HomeCubit>()
          .scaffoldKey,
      drawer: CustomerDrawer(),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Space(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.5.w),
              child: HomeAppBar(
                title: LocaleKeys.home.tr(),
                trailingIcon: AppImages.menu,
                onTrailingIconTap: () {
                  context.read<HomeCubit>().openDrawer();
                },
                leadingIcon: AppImages.cart,
                onLeadingIconTap: () {
                  context.read<HomeCubit>().navigateToCartScreen(context);
                },
              ),
            ),

            Space(
              height: 1.h,
            ),

            BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is HomeIsLoading) {
                  return CustomProgressIndicator();
                } else if (state is HomeError) {


                  return CustomErrorComponent(
                    errorMessage: HomeError.failure.message,onTap: (){
                    context.read<HomeCubit>().getHomeAds();
                  },);
                } else {
                  return Column(
                    children: [
                      SizedBox(
                        height: 65.h,
                        child: PageView.builder(
                          itemCount: HomeSuccess.homeResponse!.obj!.length,
                          padEnds: true,
                          itemBuilder: (BuildContext context, int index) {
                            return HomeCard(
                              title: HomeSuccess.homeResponse?.obj?[index]
                                  .description ?? '',
                              imageUrl: AppConsts.imgUrl +
                                  (HomeSuccess.homeResponse?.obj?[index]
                                      .imgUrl ?? ''),
                            );
                          },
                          onPageChanged: context.read<HomeCubit>().onPageChange,
                        ),
                      ),

                      BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          return Center(
                            child: CustomPageIndicator(
                              count: HomeSuccess.homeResponse!.obj!.length,
                              index: context.read<HomeCubit>().selectedIndex,
                            ),
                          );
                        },
                      ),

                      Space(
                        height: 4.h,
                      ),

                      MainButton(
                        color: AppTheme.neutral900.withOpacity(0.8),
                        width: 65.w,
                        height: 6.h,
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppImages.ctaArrow,
                              width: 5.w,
                              height: 5.w,
                            ),
                            Space(
                              width: 2.w,
                            ),
                            Text(
                              LocaleKeys.make_your_design,
                              style: AppTheme.mainTextStyle(
                                  color: AppTheme.neutral100, fontSize: 11.sp),
                            ).tr(),
                          ],
                        ),
                        onTap: () {
                          context.read<HomeCubit>().navigateToVariation(context);
                        },
                      ),
                    ],
                  );
                }
              },
            )

          ],
        ),
      ),
    );
  }
}
