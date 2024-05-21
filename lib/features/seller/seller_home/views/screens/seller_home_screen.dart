import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';
import 'package:smart_soft/core/views/widgets/custom_progress_indicator.dart';
import 'package:smart_soft/features/home/views/components/home_card.dart';

import '../../../../../core/config/app_images.dart';
import '../../../../../core/views/widgets/custom_error_component.dart';
import '../../../../../core/views/widgets/space.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../home/views/components/home_appbar.dart';
import '../blocs/seller_home/seller_home_cubit.dart';
import '../components/order_card.dart';
import '../components/seller_drawer.dart';

class SellerHomeScreen extends StatefulWidget {
  const SellerHomeScreen({super.key});

  @override
  State<SellerHomeScreen> createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen> with SingleTickerProviderStateMixin{

  late TabController tabController;


  @override
  void initState() {
    context.read<SellerHomeCubit>().getSellerOrder();
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: context
            .read<SellerHomeCubit>()
            .scaffoldKey,
        drawer: SellerDrawer(),
        body: ListView(
          shrinkWrap: true,
          children: [

            Space(
              height: 2.h,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: HomeAppBar(
                title: LocaleKeys.home.tr(),
                trailingIcon: AppImages.menu,
                onTrailingIconTap: () =>
                    context.read<SellerHomeCubit>().openDrawer(),
                leadingIcon: "",
                onLeadingIconTap: () {},
              ),
            ),
            Space(
              height: 3.h,
            ),

            TabBar(
              labelColor: AppTheme.primary900,
              indicatorColor: AppTheme.primary900,
              onTap: (index){
                context.read<SellerHomeCubit>().selectedIndex = index + 1;
                context.read<SellerHomeCubit>().getSellerOrder();
              },
              controller: tabController,
              tabs: [
                Tab(icon: Icon(Icons.done_all), text: 'تم الانتهاء'),
                Tab(icon: Icon(Icons.cancel), text: 'ملغي'),
                Tab(icon: Icon(Icons.pending), text: 'قيد التنفيذ'),
              ],
            ),

            Space(
              height: 3.h,
            ),

            SizedBox(
              height: 70.h,
              child: TabBarView(
                controller: tabController,
                children: List.generate(3, (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: BlocConsumer<SellerHomeCubit, SellerHomeState>(
                    listener: (context, state) {},
                    builder: (context, state) {

                      if(state is SellerHomeIsLoading){
                        return CustomProgressIndicator();

                      } else if(state is SellerHomeError) {
                        return CustomErrorComponent(
                          errorMessage: SellerHomeError.failure.message,onTap: (){
                          context.read<SellerHomeCubit>().getSellerOrder();
                        },);
                      }

                      else if(state is SellerHomeSuccess){
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: SellerHomeSuccess.sellerOrdersResponse?.obj?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return OrderCard(
                              sellerOrder: SellerHomeSuccess.sellerOrdersResponse!.obj![index],
                            );

                          },
                        );
                      }

                      return SizedBox();
                    },
                  ),
                )),
              ),
            ),





          ],
        ),
      ),
    );
  }
}
