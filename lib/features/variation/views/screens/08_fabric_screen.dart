import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/views/widgets/custom_header.dart';
import 'package:smart_soft/features/variation/views/bloc/fabric/fabric_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/variation/variation_cubit.dart';
import 'package:smart_soft/features/variation/views/components/variant_nav_bar.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';

import '../../../../core/config/app_consts.dart';
import '../../../../core/views/widgets/custom_error_component.dart';
import '../../../../core/views/widgets/custom_progress_indicator.dart';
import '../../../../core/views/widgets/space.dart';
import '../components/fabric_card.dart';

class FabricScreen extends StatefulWidget {
  const FabricScreen({super.key});

  @override
  State<FabricScreen> createState() => _FabricScreenState();
}

class _FabricScreenState extends State<FabricScreen> {

  @override
  void initState() {
    context.read<FabricCubit>().getFabric(context);
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
                child: CustomHeader(title: LocaleKeys.fabric.tr(),),
              ),


              Space(
                height: 3.h,
              ),

            BlocConsumer<FabricCubit, FabricState>(
              listener: (context, state) {},
              builder: (context, state) {

              if(state is FabricIsLoading){
              return CustomProgressIndicator();

              } else if(state is FabricError) {

                return CustomErrorComponent(
                  errorMessage: FabricError.error.message,onTap: (){
                  context.read<FabricCubit>().getFabric(context);
                },);

              } else if(state is FabricSuccess) {
                return ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [




                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: FabricSuccess.fabrics.length,
                        itemBuilder: (context,index){
                          // FabricSuccess.fabrics[index].
                         return  FabricCard(
                           imgUrl: AppConsts.imgUrl + FabricSuccess.fabrics[index].imgUrl.toString(),
                           name: FabricSuccess.fabrics[index].name ?? 'unKnown',
                           description: FabricSuccess.fabrics[index].description ?? 'unKnown',
                           price: FabricSuccess.fabrics[index].price ?? 0.0,
                           onTap: () {

                             context.read<FabricCubit>().onFabricCardTap(FabricSuccess.fabrics[index].id ?? -1,context);

                           },
                         );
                    }),

                    Space(
                      height: 3.h,
                    ),

                  ],
                );
              }

              return SizedBox();
              },
            ),
          ],
        ),



      ),
    );
  }
}
