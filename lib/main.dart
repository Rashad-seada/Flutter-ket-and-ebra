import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/admin/admin_home/views/bloc/admin_home/admin_home_cubit.dart';
import 'package:smart_soft/features/auth/views/blocs/otp/otp_cubit.dart';
import 'package:smart_soft/features/auth/views/blocs/reset_password/reset_password_cubit.dart';
import 'package:smart_soft/features/cart/views/blocs/cart/cart_cubit.dart';
import 'package:smart_soft/features/home/views/bloc/home/home_cubit.dart';
import 'package:smart_soft/features/order/views/blocs/get_orders/get_orders_cubit.dart';
import 'package:smart_soft/features/order/views/blocs/orders/order_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/button/button_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/chest/chest_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/collar/collar_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/details/details_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/embroidery/embroidery_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/fabric/fabric_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/front_pocket/front_pocket_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/size/size_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/sleeve/sleeve_cubit.dart';
import 'package:smart_soft/features/variation/views/bloc/variation/variation_cubit.dart';
import 'core/bloc/core_cubit.dart';
import 'core/config/app_theme.dart';
import 'features/auth/views/blocs/login/login_cubit.dart';
import 'features/auth/views/blocs/register/register_cubit.dart';

import 'features/onboarding/view/bloc/on_boarding_cubit.dart';
import 'features/onboarding/view/screens/00_on_boarding_screen.dart';
import 'features/seller/add_variation/views/blocs/seller_variations/seller_variations_cubit.dart';
import 'features/seller/seller_home/views/blocs/seller_home/seller_home_cubit.dart';
import 'generated/codegen_loader.g.dart';

void main() async {

   await CoreCubit.setupApp();

   runApp(
   EasyLocalization(
       supportedLocales: const [Locale('en'), Locale('ar')],
       fallbackLocale: const Locale('en'),
       assetLoader: const CodegenLoader(),
       path: "assets/translations/",
       child: const MyApp())
   );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(create: (_) => CoreCubit()),
        BlocProvider(create: (_) => OnBoardingCubit()),
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => RegisterCubit()),
        BlocProvider(create: (_) => ResetPasswordCubit()),
        BlocProvider(create: (_) => OtpCubit()),
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => VariationCubit()),
        BlocProvider(create: (_) => SizeCubit()),
        BlocProvider(create: (_) => DetailsCubit()),
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => SellerHomeCubit()),
        BlocProvider(create: (_) => AdminHomeCubit()),
        BlocProvider(create: (_) => FabricCubit()),
        BlocProvider(create: (_) => CollarCubit()),
        BlocProvider(create: (_) => FrontPocketCubit()),
        BlocProvider(create: (_) => ChestCubit()),
        BlocProvider(create: (_) => SleeveCubit()),
        BlocProvider(create: (_) => ButtonCubit()),
        BlocProvider(create: (_) => EmbroideryCubit()),
        BlocProvider(create: (_) => SellerVariationsCubit()),
        BlocProvider(create: (_) => OrderCubit()),
        BlocProvider(create: (_) => GetOrdersCubit()),

      ],
      child: Sizer(
        builder: (BuildContext context, Orientation orientation,
            DeviceType deviceType) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            home: const OnBoardingScreen(),
            theme: AppTheme.theme(context),
          );
        },
      ),
    );
  }
}
