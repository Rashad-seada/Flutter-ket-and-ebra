import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/views/widgets/custom_progress_indicator.dart';
import 'package:smart_soft/features/order/views/blocs/get_orders/get_orders_cubit.dart';
import 'package:smart_soft/features/order/views/components/order_item.dart';
import 'package:smart_soft/features/seller/seller_home/views/components/order_card.dart';

import '../../../../core/views/widgets/custom_error_component.dart';
import '../../../../core/views/widgets/custom_header.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {

  @override
  void initState() {
    context.read<GetOrdersCubit>().getOrder();
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
                child: CustomHeader(title: LocaleKeys.order.tr(),
                    showCart: false,
                    showBackButton: true),
              ),

              Space(
                height: 3.h,
              ),

              BlocConsumer<GetOrdersCubit, GetOrdersState>(
                listener: (context, state) {},
                builder: (context, state) {

                  if(state is GetOrdersIsLoading){
                    return CustomProgressIndicator();

                  }else if(state is GetOrdersError){
                    return CustomErrorComponent(
                      errorMessage: GetOrdersError.failure.message,onTap: (){
                      context.read<GetOrdersCubit>().getOrder();
                    },);

                  }
                  else if(state is GetOrdersSuccess){
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      shrinkWrap: true,
                      itemCount: GetOrdersSuccess.getAllOrdersResponse?.obj?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return OrderItem(orderItemEntity: GetOrdersSuccess.getAllOrdersResponse!.obj![index],);
                      },
                    );
                  };

                  return SizedBox();
                  }

              ),

              Space(
                height: 3.h,
              ),

            ],
          ),
        ));
  }
}
