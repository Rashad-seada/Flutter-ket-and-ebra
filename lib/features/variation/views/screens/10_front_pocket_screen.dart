import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_consts.dart';
import 'package:smart_soft/features/variation/views/bloc/collar/collar_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/front_pocket/front_pocket_cubit.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_error_component.dart';
import '../../../../core/views/widgets/custom_header.dart';
import '../../../../core/views/widgets/custom_progress_indicator.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/chest/chest_cubit.dart';
import '../bloc/sleeve/sleeve_cubit.dart';
import '../bloc/variation/variation_cubit.dart';
import '../components/variant_card.dart';
import '../components/variant_nav_bar.dart';

class FrontPocketScreen extends StatefulWidget {
  const FrontPocketScreen({super.key});

  @override
  State<FrontPocketScreen> createState() => _FrontPocketScreenState();
}

class _FrontPocketScreenState extends State<FrontPocketScreen> {
  @override
  void initState() {
    context.read<FrontPocketCubit>().getFrontPocket(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await context.read<CollarCubit>().refresh();
        return true;
      },
      child: SafeArea(
          child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: MainButton(
            color: AppTheme.primary900,
            width: 86.w,
            height: 6.5.h,
            label: Text(
              LocaleKeys.next,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral100, fontSize: 13.sp),
            ).tr(),
            onTap: () => context.read<FrontPocketCubit>().next(context),
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Space(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.5.w),
              child: CustomHeader(
                title: LocaleKeys.front_pocket.tr(),
                onPop:(){
                  context.read<CollarCubit>().refresh();
                },
              ),
            ),
            Space(
              height: 3.h,
            ),
            BlocConsumer<FrontPocketCubit, FrontPocketState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                int frontPocketId =
                    context.read<FrontPocketCubit>().frontPocketId;
                if (state is FrontPocketIsLoading) {
                  return CustomProgressIndicator();
                } else if (state is FrontPocketError) {
                  return CustomErrorComponent(
                    errorMessage: FrontPocketError.error.message,
                    onTap: () {
                      context.read<FrontPocketCubit>().getFrontPocket(context);
                    },
                  );
                } else if (state is FrontPocketSuccess ||
                    state is FrontPocketSelected || state is RefreshFrontPocketScreen) {
                  return Column(
                    children: [
                      Space(
                        height: 3.h,
                      ),

                      Stack(
                        children: [
                          Image.asset(
                            "images/empty_thob.png",
                            width: 300,
                            height: 300,
                            fit: BoxFit.contain,
                          ),
                          Positioned(
                            top: 80,
                            right: 40,
                            child: Image.asset(
                              context
                                  .read<FrontPocketCubit>()
                                  .frontPockets[frontPocketId],
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            child: Image.asset(
                              context.read<CollarCubit>().collars[
                                  context.read<CollarCubit>().collarId],
                              width: 80,
                              height: 80,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0,
                            child: Image.asset(
                              context
                                  .read<ChestCubit>()
                                  .chests[context.read<ChestCubit>().chestId],
                              width: 80,
                              height: 80,
                            ),
                          ),
                          Positioned(
                            top: 110,
                            left: 30,
                            child: Image.asset(
                              context.read<SleeveCubit>().sleeves[
                                  context.read<SleeveCubit>().sleeveId],
                              width: 120,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),

                      // SvgPicture.asset(
                      //   fit: BoxFit.fitHeight,
                      //   AppImages.cloth,
                      //   width: 100.w,
                      //   height: 30.h,
                      //   color: AppTheme.neutral400,
                      // ),

                      Space(
                        height: 5.h,
                      ),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 7.w),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Number of columns
                          crossAxisSpacing: 3.w, // Spacing between columns
                          mainAxisSpacing: 3.w, // Spacing between rows
                        ),
                        //padding: EdgeInsets.all(10.0), // Padding around the GridView
                        itemCount: context
                            .read<FrontPocketCubit>()
                            .frontPockets
                            .length,
                        //FrontPocketSuccess.frontPockets.length,
                        // Number of items
                        itemBuilder: (BuildContext context, int index) {
                          // Function that returns a widget for each item
                          return VariantCard(
                              isSelect: index == frontPocketId,
                              title: "frontPocket$index",
                              //FrontPocketSuccess.frontPockets[index].name ?? "unknown",
                              imgUrl: context
                                  .read<FrontPocketCubit>()
                                  .frontPockets[index],
                              //AppConsts.imgUrl + FrontPocketSuccess.frontPockets[index].imgUrl.toString(),
                              onTap: () => context
                                  .read<FrontPocketCubit>()
                                  .onFrontPocketCardTap(index, context)
                              // context
                              // .read<FrontPocketCubit>()
                              // .onFrontPocketCardTap(
                              //     FrontPocketSuccess.frontPockets[index].id ??
                              //         -1,
                              //     context),
                              );
                        },
                      ),
                    ],
                  );
                }

                return SizedBox();
              },
            ),
          ],
        ),
      )),
    );
  }
}
