import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_images.dart';
import 'package:smart_soft/core/config/app_theme.dart';
import 'package:smart_soft/core/views/widgets/custom_progress_indicator.dart';
import 'package:smart_soft/features/admin/admin_home/views/bloc/home_ads/home_ads_cubit.dart';
import 'package:smart_soft/generated/locale_keys.g.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/views/widgets/custom_error_component.dart';
import '../../../../../core/views/widgets/custom_header.dart';
import '../../../../../core/views/widgets/space.dart';
import '../components/ad_item.dart';


class ViewAdsItemsScreen extends StatefulWidget {

  ViewAdsItemsScreen({super.key});

  @override
  State<ViewAdsItemsScreen> createState() => _ViewAdsItemsScreenState();
}

class _ViewAdsItemsScreenState extends State<ViewAdsItemsScreen> {

  @override
  void initState() {
    context.read<HomeAdsCubit>().getHomeAds();
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
            child: CustomHeader(
              title: LocaleKeys.home_ads.tr(),
              showCart: false,
            ),
          ),
          Space(
            height: 3.h,
          ),

          BlocConsumer<HomeAdsCubit,HomeAdsState>(
            listener: (context, state) {},
            builder: (context, state) {

              if(state is HomeAdsIsLoading){
                return CustomProgressIndicator();

              } else if(state is HomeAdsError){
                return CustomErrorComponent(
                  errorMessage: HomeAdsError.failure.message,
                  onTap: ()=> context.read<HomeAdsCubit>().getHomeAds(),

                );

              } else if(state is HomeAdsSuccess) {

                if(HomeAdsSuccess.homeAdsByAdminResponse?.obj?.isEmpty ?? true){
                  return Column(
                    children: [


                      Space(height: 25.h,),

                      Image.asset( AppImages.empty,
                        fit: BoxFit.fitHeight,
                        width: 40.w,
                        height: 30.w,
                      ),

                      Space(height: 3.h,),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text(
                          LocaleKeys.empty_seller_item,
                          style: AppTheme.mainTextStyle(
                            color: AppTheme.neutral500, fontSize: 12.sp,),
                          textAlign: TextAlign.center,

                        ).tr(),
                      ),

                    ],
                  );

                }
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: HomeAdsSuccess.homeAdsByAdminResponse?.obj?.length ?? 0,
                  itemBuilder: (context,index){
                    return AdItemItem(
                        sellerVariationModel: HomeAdsSuccess.homeAdsByAdminResponse!.obj![index],
                        onDelete: (){
                          context.read<HomeAdsCubit>().onDelete(context,HomeAdsSuccess.homeAdsByAdminResponse!.obj![index].id!);
                        },
                    );
                  });
                }

              return const SizedBox();
            },
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.primary900,
        onPressed: () {
          context.read<HomeAdsCubit>().onAddTap(context,);
          },
        child: Text("+",style: TextStyle(fontSize: 20.sp,color: AppTheme.neutral100),),
      ),
    ));
  }
}

