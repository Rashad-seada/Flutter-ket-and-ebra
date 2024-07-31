import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/views/widgets/custom_progress_indicator.dart';
import 'package:smart_soft/core/views/widgets/main_button.dart';
import 'package:smart_soft/features/variation/views/bloc/collar/collar_cubit.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_error_component.dart';
import '../../../../core/views/widgets/custom_header.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/chest/chest_cubit.dart';
import '../bloc/front_pocket/front_pocket_cubit.dart';
import '../bloc/sleeve/sleeve_cubit.dart';
import '../components/variant_card.dart';

class CollarScreen extends StatefulWidget {
  const CollarScreen({super.key});

  @override
  State<CollarScreen> createState() => _CollarScreenState();
}

class _CollarScreenState extends State<CollarScreen> {
  @override
  void initState() {
    context.read<CollarCubit>().getCollars(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          onTap: () => context.read<CollarCubit>().next(context),
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
              title: LocaleKeys.collar.tr(),
            ),
          ),
          Space(
            height: 3.h,
          ),
          BlocConsumer<CollarCubit, CollarState>(
            listener: (context, state) {},
            builder: (context, state) {
              int collarId = context.read<CollarCubit>().collarId;
              if (state is CollarIsLoading) {
                return CustomProgressIndicator();
              } else if (state is CollarError) {
                return CustomErrorComponent(
                  errorMessage: CollarError.error.message,
                  onTap: () {
                    context.read<CollarCubit>().getCollars(context);
                  },
                );
              } else if (state is CollarSuccess || state is CollarSelected || state is RefreshCollarScreen) {
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
                                context.read<FrontPocketCubit>().frontPocketId],
                            width: 100,
                            height: 100,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          child: Image.asset(
                            context
                                .read<CollarCubit>()
                                .collars[context.read<CollarCubit>().collarId],
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
                            context
                                .read<SleeveCubit>()
                                .sleeves[context.read<SleeveCubit>().sleeveId],
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
                      itemCount: context.read<CollarCubit>().collars.length,
                      //CollarSuccess.collars.length,
                      // Number of items
                      itemBuilder: (BuildContext context, int index) {
                        // Function that returns a widget for each item
                        return VariantCard(
                            isSelect: index == collarId,
                            title: "yaka$index",
                            //CollarSuccess.collars[index].name ?? "unknown",
                            imgUrl: context.read<CollarCubit>().collars[index],
                            // AppConsts.imgUrl +
                            //     CollarSuccess.collars[index].imgUrl.toString(),
                            onTap: () =>
                                context.read<CollarCubit>().onCollarCardTap(
                                    // CollarSuccess.collars[index].id ?? -1,
                                    // context
                                    index,
                                    context));
                      },
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    ));
  }
}
