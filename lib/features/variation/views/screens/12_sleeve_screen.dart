import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/variation/views/bloc/sleeve/sleeve_cubit.dart';

import '../../../../core/config/app_consts.dart';
import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_error_component.dart';
import '../../../../core/views/widgets/custom_header.dart';
import '../../../../core/views/widgets/custom_progress_indicator.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/chest/chest_cubit.dart';
import '../bloc/collar/collar_cubit.dart';
import '../bloc/front_pocket/front_pocket_cubit.dart';
import '../components/variant_card.dart';

class SleeveScreen extends StatefulWidget {
  const SleeveScreen({super.key});

  @override
  State<SleeveScreen> createState() => _SleeveScreenState();
}

class _SleeveScreenState extends State<SleeveScreen> {
  @override
  void initState() {
    context.read<SleeveCubit>().getSleeve(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await context.read<ChestCubit>().refresh();
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
            onTap: () => context.read<SleeveCubit>().next(context),
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
                title: LocaleKeys.sleeve.tr(),
                onPop: () {
                  context.read<ChestCubit>().refresh();
                },
              ),
            ),
            Space(
              height: 3.h,
            ),
            BlocConsumer<SleeveCubit, SleeveState>(
              listener: (context, state) {},
              builder: (context, state) {
                int sleeveId = context.read<SleeveCubit>().sleeveId;
                if (state is SleeveIsLoading) {
                  return CustomProgressIndicator();
                } else if (state is SleeveError) {
                  return CustomErrorComponent(
                    errorMessage: SleeveError.error.message,
                    onTap: () {
                      context.read<SleeveCubit>().getSleeve(context);
                    },
                  );
                } else if (state is SleeveSuccess || state is SleeveSelected) {
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
                              context.read<FrontPocketCubit>().frontPockets[
                                  context
                                      .read<FrontPocketCubit>()
                                      .frontPocketId],
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
                              context.read<SleeveCubit>().sleeves[sleeveId],
                              width: 120,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
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
                        itemCount: context.read<SleeveCubit>().sleeves.length,
                        //SleeveSuccess.sleeves.length,
                        // Number of items
                        itemBuilder: (BuildContext context, int index) {
                          // Function that returns a widget for each item
                          return VariantCard(
                            isSelect: index == sleeveId,
                            title: "sleeves$index",
                            //SleeveSuccess.sleeves[index].name ?? "Unknown",
                            imgUrl: context.read<SleeveCubit>().sleeves[index],
                            // AppConsts.imgUrl +
                            //     SleeveSuccess.sleeves[index].imgUrl.toString(),
                            onTap: () => context
                                .read<SleeveCubit>()
                                .onSleeveTap(index, context),
                            // context.read<SleeveCubit>().onSleeveTap(
                            // SleeveSuccess.sleeves[index].id ?? -1, context),
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
