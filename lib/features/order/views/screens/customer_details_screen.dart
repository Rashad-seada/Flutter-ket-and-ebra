import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/views/widgets/custom_progress_indicator.dart';
import 'package:smart_soft/features/order/views/blocs/orders/order_cubit.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_header.dart';
import '../../../../core/views/widgets/custom_text_field.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../components/location_drop_down.dart';

class CustomerDetailsScreen extends StatefulWidget {
  const CustomerDetailsScreen({super.key});

  @override
  State<CustomerDetailsScreen> createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {

  @override
  void initState() {
    context.read<OrderCubit>().getAllCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: ListView(
        children: [

          Space(
            height: 2.h,
          ),

          CustomHeader(
            title: LocaleKeys.customer_details.tr(), showCart: false,),

          Space(
            height: 3.h,
          ),


          BlocConsumer<OrderCubit,OrderState>(
            listener: (context, state) {
            },
            builder: (context, state) {

              if(state is OrderIsLoading && OrderIsLoading.citiesIsLoading){
                return CustomProgressIndicator();

              } else if(state is OrderError){
                return Text(OrderError.failure.message);

              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.username,
                      style: AppTheme.mainTextStyle(
                          color: AppTheme.neutral400, fontSize: 12.sp),
                    ).tr(),

                    Space(
                      height: 0.5.h,
                    ),


                    CustomTextField(
                      controller: context
                          .read<OrderCubit>()
                          .usernameController,
                      validator: (_) => context.read<OrderCubit>().validateUsername(),

                      prefixIcon: Padding(
                        padding: EdgeInsets.all(3.w),
                        child: SvgPicture.asset(
                          AppImages.profile,
                          width: 3.w,
                          height: 3.h,
                        ),

                      ),
                      hint: LocaleKeys.username_hint.tr(),
                    ),

                    Space(
                      height: 1.h,
                    ),

                    Text(
                      LocaleKeys.phone_number,
                      style: AppTheme.mainTextStyle(
                          color: AppTheme.neutral400, fontSize: 12.sp),
                    ).tr(),
                    Space(
                      height: 0.5.h,
                    ),


                    CustomTextField(
                      controller: context
                          .read<OrderCubit>()
                          .phoneNumberController,
                      validator: (_) => context.read<OrderCubit>().validatePhone(),

                      prefixIcon: Padding(
                        padding: EdgeInsets.all(3.w),
                        child: SvgPicture.asset(
                          AppImages.phone,
                          width: 3.w,
                          height: 3.h,
                        ),

                      ),
                      hint: LocaleKeys.phone_number_hint.tr(),
                    ),


                    Space(
                      height: 1.h,
                    ),

                    Text(
                      LocaleKeys.location,
                      style: AppTheme.mainTextStyle(
                          color: AppTheme.neutral400, fontSize: 12.sp),
                    ).tr(),
                    Space(
                      height: 0.5.h,
                    ),

                    LocationDropDown(
                      width: 86.w,
                      height: 6.h,
                      cities: OrderSuccess.allCitiesResponse?.obj ?? [],
                      onChanged: (city){
                        context.read<OrderCubit>().selectedCity = city;
                        setState(() {});
                      },
                      selectedCity: context.read<OrderCubit>().selectedCity!,
                    ),

                    Space(
                      height: 5.h,
                    ),

                    MainButton(
                      color: AppTheme.primary900,
                      width: 86.w,
                      height: 6.5.h,
                      label: (state is OrderIsLoading && OrderIsLoading.createOrderIsLoading)? CustomProgressIndicator(color: AppTheme.neutral100,):Text(
                        LocaleKeys.next,
                        style: AppTheme.mainTextStyle(
                            color: AppTheme.neutral100, fontSize: 13.sp),
                      ).tr(),
                      onTap: () =>
                          context.read<OrderCubit>().onCustomerDetailsNextClick(
                              context),
                    ),

                  ],
                );
              }

            },
          ),


        ],
      ),
    ),));
  }
}
