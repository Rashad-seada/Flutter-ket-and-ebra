import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/views/widgets/custom_header.dart';
import 'package:smart_soft/core/views/widgets/custom_progress_indicator.dart';
import 'package:smart_soft/features/variation/views/bloc/variation/variation_cubit.dart';
import 'package:smart_soft/features/variation/views/components/tailor_filter_card.dart';
import 'package:smart_soft/features/variation/views/components/variant_nav_bar.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';

import '../../../../core/config/app_consts.dart';
import '../../../../core/views/widgets/custom_error_component.dart';
import '../../../../core/views/widgets/space.dart';
import '../components/fabric_card.dart';
import '../components/tailor_card.dart';

class TailorScreen extends StatefulWidget {
  const TailorScreen({super.key});

  @override
  State<TailorScreen> createState() => _TailorScreenState();
}

class _TailorScreenState extends State<TailorScreen> {

  @override
  void initState() {
    context.read<VariationCubit>().getAllSeller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: [

            Space(
              height: 2.h,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.5.w),
              child: CustomHeader(title: LocaleKeys.chose_tailor.tr(),),
            ),

            Space(
              height: 3.h,
            ),

            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 6.5.w),
            //   child: TailorFilterCard(
            //     onTap: () {},
            //   ),
            // ),

            Space(
              height: 3.h,
            ),

            BlocConsumer<VariationCubit, VariationState>(
              listener: (context, state) {},
              builder: (context, state) {

                if(state is VariationIsLoading){
                  return CustomProgressIndicator();

                } else if(state is VariationError) {

                  return CustomErrorComponent(
                    errorMessage: VariationError.error.message,onTap: (){
                    context.read<VariationCubit>().getAllSeller();
                  },);

                } else if(state is VariationSuccess || state is VariationInitial){
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                      itemCount: VariationSuccess.sellers.length,
                      itemBuilder: (context,index){
                        return TailorCard(
                          name: VariationSuccess.sellers[index].name?? "unKnown",
                          imgUrl: AppConsts.imgUrl + VariationSuccess.sellers[index].profileImg.toString(),
                          rating: 5, onTap: () {
                          context.read<VariationCubit>().onSellerCardTap(VariationSuccess.sellers[index].id ?? -1, context);
                        },
                        );
                      });
                }

                return SizedBox();

              },
            ),


            Space(
              height: 3.h,
            ),

          ],
        ),


      ),
    );
  }
}
