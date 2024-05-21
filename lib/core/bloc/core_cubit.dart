import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/features/admin/admin_home/views/screens/admin_home_screen.dart';
import 'package:smart_soft/features/auth/views/screens/00_auth_methods_screen.dart';
import 'package:smart_soft/features/home/views/screens/06_home_screen.dart';
import 'package:smart_soft/features/onboarding/view/screens/00_on_boarding_screen.dart';
import 'package:smart_soft/features/seller/seller_home/views/screens/seller_home_screen.dart';

import '../../features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import '../../features/auth/domain/usecases/get_user_use_case.dart';
import '../../features/auth/utils/role.dart';
import '../../firebase_options.dart';
import '../config/app_theme.dart';
import '../di/app_module.dart';
import '../infrastructure/database/database.dart';
import '../views/widgets/custom_flush_bar.dart';

part 'core_state.dart';

class CoreCubit extends Cubit<CoreState> {
  CoreCubit() : super(CoreInitial());

  static late AppDatabase database;


  static Future<void> setupApp() async {

    // change the color of the system status bar and nav bar
    AppTheme.initSystemNavAndStatusBar();

    // prepare the widgets to be displayed
    WidgetsFlutterBinding.ensureInitialized();

    // makes the application always vertical
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // init shared pref
    AuthLocalDataSourceImpl.initHive();

    // initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // prepare the dependencies that the application needs to run
    AppModule.setup();

    // initialize locale
    await EasyLocalization.ensureInitialized();

    // initialize database
    //database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  }

  getUser(BuildContext context){
    getIt<GetUserUseCase>().call().then((value) => value.fold(
            (error) {

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> OnBoardingScreen()));

            },
            (user) {
              
              if(user.token != null){
                switch(user.role) {

                  case Role.admin :
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> AdminHomeScreen()));
                    break;

                  case Role.seller :
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> SellerHomeScreen()));
                    break;

                  case Role.customer :
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> HomeScreen()));
                    break;

                  default:
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> AuthMethodsScreen()));
                    break;
                }

              } else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> OnBoardingScreen()));
              }


          

        }
    ));

  }



}
