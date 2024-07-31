import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/variation/views/bloc/embroidery/embroidery_cubit.dart';
import 'package:smart_soft/features/variation/views/components/embroidery_card.dart';

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
import '../bloc/sleeve/sleeve_cubit.dart';
import '../bloc/variation/variation_cubit.dart';
import '../components/variant_card.dart';
import '../components/variant_nav_bar.dart';

class EmbroideryScreen extends StatefulWidget {
  const EmbroideryScreen({super.key});

  @override
  State<EmbroideryScreen> createState() => _EmbroideryScreenState();
}

class _EmbroideryScreenState extends State<EmbroideryScreen> {
  @override
  void initState() {
    context.read<EmbroideryCubit>().getEmbroidery(context);
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
          onTap: () => context.read<EmbroideryCubit>().next(context),
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
              title: LocaleKeys.embroidery.tr(),
            ),
          ),
          Space(
            height: 3.h,
          ),
          BlocConsumer<EmbroideryCubit, EmbroideryState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is EmbroideryIsLoading) {
                return CustomProgressIndicator();
              } else if (state is EmbroideryError) {
                return CustomErrorComponent(
                  errorMessage: EmbroideryError.error.message,
                  onTap: () {
                    context.read<EmbroideryCubit>().getEmbroidery(context);
                  },
                );
              } else if (state is EmbroiderySuccess) {}
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
                  Space(
                    height: 5.h,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: EmbroiderySuccess.embroiderys.length,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    itemBuilder: (BuildContext context, int index) {
                      return EmbroideryCard(
                        title: EmbroiderySuccess.embroiderys[index].name ??
                            "Unknown",
                        imgUrl: AppConsts.imgUrl +
                            EmbroiderySuccess.embroiderys[index].imgUrl
                                .toString(),
                        price: EmbroiderySuccess.embroiderys[index].price ?? 0,
                        onTap: () => context
                            .read<EmbroideryCubit>()
                            .onEmbroideryTap(
                                EmbroiderySuccess.embroiderys[index].id ?? -1,
                                context),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    ));
  }
}
