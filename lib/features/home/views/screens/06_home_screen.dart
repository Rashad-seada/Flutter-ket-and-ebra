import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_images.dart';
import 'package:smart_soft/core/views/widgets/custom_progress_indicator.dart';
import 'package:smart_soft/features/home/views/bloc/home/home_cubit.dart';
import 'package:smart_soft/features/home/views/components/customer_drawer.dart';
import 'package:smart_soft/features/home/views/components/home_card.dart';

import '../../../../core/config/app_consts.dart';
import '../../../../core/views/widgets/custom_page_indicator.dart';
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
      key: context.read<HomeCubit>().scaffoldKey,
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

            BlocConsumer<HomeCubit,HomeState>(
              listener: (context, state) {},
              builder: (context, state) {

                if(state is HomeIsLoading){
                  return CustomProgressIndicator();
                } else if(state is HomeError) {
                  return Text(HomeError.failure.message);
                } else if(state is HomeSuccess){
                  return Column(
                    children: [
                      SizedBox(
                        height: 80.h,
                        child: PageView.builder(
                          itemCount: HomeSuccess.homeResponse!.obj!.length,
                          padEnds: true,
                          itemBuilder: (BuildContext context, int index) {
                            return HomeCard(
                              title: HomeSuccess.homeResponse?.obj?[index].description ?? '',
                              imageUrl: AppConsts.imgUrl+ (HomeSuccess.homeResponse?.obj?[index].imgUrl ?? ''),
                            );
                          },

                        ),
                      ),
                      Space(
                        height: 2.h,
                      ),
                      Center(
                        child: CustomPageIndicator(
                          count: 5,
                          index: 0,
                        ),
                      ),
                    ],
                  );

                }else {
                  return SizedBox();
                }

              },
            )

          ],
        ),
      ),
    );
  }
}
