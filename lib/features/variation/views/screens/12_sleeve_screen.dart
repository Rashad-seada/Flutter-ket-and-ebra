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
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
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
    return SafeArea(child: Scaffold(
      body: ListView(
        shrinkWrap: true,

        children: [

          Space(
            height: 2.h,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.5.w),
            child: CustomHeader(title: LocaleKeys.sleeve.tr(),),
          ),

          Space(
            height: 3.h,
          ),



          BlocConsumer<SleeveCubit, SleeveState>(
            listener: (context, state) {

            },
            builder: (context, state) {

              if(state is SleeveIsLoading){
              return CustomProgressIndicator();

              } else if(state is SleeveError){

                return CustomErrorComponent(
                  errorMessage: SleeveError.error.message,onTap: (){
                  context.read<SleeveCubit>().getSleeve(context);
                },);

              } else if(state is SleeveSuccess){
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
                    itemCount: SleeveSuccess.sleeves.length,
                    // Number of items
                    itemBuilder: (BuildContext context, int index) {
                      // Function that returns a widget for each item
                      return VariantCard(
                        isSelect: index == 0,
                        title: SleeveSuccess.sleeves[index].name ?? "Unknown",
                        imgUrl: AppConsts.imgUrl + SleeveSuccess.sleeves[index].imgUrl.toString(),
                        onTap: ()=> context.read<SleeveCubit>().onSleeveTap(SleeveSuccess.sleeves[index].id ?? -1, context),
                      );
                    },
                  ),
                ],
              );}

              return SizedBox();
            },
          ),


        ],
      ),

    ));
  }
}
