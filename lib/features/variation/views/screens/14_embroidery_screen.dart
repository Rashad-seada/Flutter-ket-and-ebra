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
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
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
    return SafeArea(child: Scaffold(
      body: ListView(
        shrinkWrap: true,

        children: [

          Space(
            height: 2.h,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.5.w),
            child: CustomHeader(title: LocaleKeys.embroidery.tr(),),
          ),

          Space(
            height: 3.h,
          ),



          BlocConsumer<EmbroideryCubit, EmbroideryState>(
            listener: (context, state) {},
            builder: (context, state) {

              if(state is EmbroideryIsLoading){
              return CustomProgressIndicator();

              } else if(state is EmbroideryError){
                return CustomErrorComponent(
                  errorMessage: EmbroideryError.error.message,onTap: (){
                  context.read<EmbroideryCubit>().getEmbroidery(context);
                },);

              } else if(state is EmbroiderySuccess){

              }
              return Column(
                children: [
                  Space(
                    height: 3.h,
                  ),

                  SvgPicture.asset(
                    fit: BoxFit.fitHeight,
                    AppImages.cloth,
                    width: 100.w,
                    height: 30.h,
                    color: AppTheme.neutral400,
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
                        title: EmbroiderySuccess.embroiderys[index].name ?? "Unknown",
                        imgUrl: AppConsts.imgUrl + EmbroiderySuccess.embroiderys[index].imgUrl.toString(),
                        price: EmbroiderySuccess.embroiderys[index].price ?? 0,
                        onTap: ()=> context.read<EmbroideryCubit>().onEmbroideryTap(EmbroiderySuccess.embroiderys[index].id ?? -1, context),
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
