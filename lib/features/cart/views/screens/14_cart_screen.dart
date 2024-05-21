import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/views/widgets/custom_header.dart';
import 'package:smart_soft/core/views/widgets/custom_progress_indicator.dart';
import 'package:smart_soft/core/views/widgets/space.dart';
import 'package:smart_soft/features/cart/views/blocs/cart/cart_cubit.dart';
import 'package:smart_soft/features/cart/views/components/cart_card.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_error_component.dart';
import '../../../../generated/locale_keys.g.dart';
import '../components/cart_nav_bar.dart';


class CartScreen extends StatefulWidget {
  bool showContinueButton;
  bool showBackButton;
  CartScreen({super.key, this.showContinueButton = false,this.showBackButton = true});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    context.read<CartCubit>().getCart();
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
            child: CustomHeader(title: LocaleKeys.cart.tr(), showCart: false,showBackButton: widget.showBackButton,),
          ),

          Space(
            height: 3.h,
          ),

          BlocConsumer<CartCubit,CartState>(
            listener: (context, state) {},
            builder: (context, state) {

              if(state is CartIsLoading){
                return CustomProgressIndicator();

              } else if(state is CartError){

                return CustomErrorComponent(
                  errorMessage: CartError.failure.message,onTap: (){
                  context.read<CartCubit>().getCart();
                },);

              } else if(state is CartSuccess){

                if(CartSuccess.cartResponse?.obj?.details?.isNotEmpty ?? false){
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    itemCount: CartSuccess.cartResponse?.obj?.details?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return CartCard(
                        details: CartSuccess.cartResponse!.obj!.details![index],
                      );
                    },
                  );
                }else {
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
                          LocaleKeys.empty_cart_item,
                          style: AppTheme.mainTextStyle(
                            color: AppTheme.neutral500, fontSize: 12.sp,),
                          textAlign: TextAlign.center,
                        ).tr(),
                      ),
                    ],
                  );
                }
              }

              return SizedBox();

            },
          ),


        ],
      ),
      bottomNavigationBar: BlocConsumer<CartCubit,CartState>(
      listener: (context, state) {},
        builder: (context, state) {
          return CartNavBar(
              isCheckoutActive: CartSuccess.cartResponse?.obj?.details?.isNotEmpty ?? false,

              showContinueButton: widget.showContinueButton,
              onCheckoutClick: () =>
                  context.read<CartCubit>().onCheckoutClick(context),
              onContinueShoppingClick: () =>
                  context.read<CartCubit>().onContinueShoppingClick(context),
            );
        },
      ),
    ));
  }
}
