import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/variation/views/bloc/chest/chest_cubit.dart';

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

class ChestScreen extends StatefulWidget {
  const ChestScreen({super.key});

  @override
  State<ChestScreen> createState() => _ChestScreenState();
}

class _ChestScreenState extends State<ChestScreen> {

 @override
  void initState() {
    context.read<ChestCubit>().getChest(context);
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
            child: CustomHeader(title: LocaleKeys.chest.tr(),),
          ),

          Space(
            height: 3.h,
          ),



          BlocBuilder<ChestCubit, ChestState>(
            builder: (context, state) {

              if(state is ChestIsLoading){
              return CustomProgressIndicator();

              } else if(state is ChestError){

                return CustomErrorComponent(
                  errorMessage: ChestError.error.message,onTap: (){
                  context.read<ChestCubit>().getChest(context);
                },);

              } else if(state is ChestSuccess){
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
                        right:40,
                        child: Image.asset(
                          "images/front_pocket.png",
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        left:0,
                        child: Image.asset(
                          "images/yaka.png",
                          width: 80,
                          height: 80,
                        ),
                      ),

                      Positioned(
                        top: 0,
                        right: 0,
                        bottom: 0,
                        left:0,
                        child: Image.asset(
                          "images/ches.png",
                          width: 80,
                          height: 80,

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
                    itemCount: ChestSuccess.chests.length,
                    // Number of items
                    itemBuilder: (BuildContext context, int index) {
                      // Function that returns a widget for each item
                      return VariantCard(
                        isSelect: index == 0,
                        title: ChestSuccess.chests[index].name ?? "Unknown",
                        imgUrl: AppConsts.imgUrl + ChestSuccess.chests[index].imgUrl.toString(),
                        onTap: ()=> context.read<ChestCubit>().onChestTap(ChestSuccess.chests[index].id ?? -1, context),
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
