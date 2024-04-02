import 'package:get_it/get_it.dart';
import 'package:smart_soft/core/core_feature/data/data_source/local/core_features_remote_data_source.dart';
import 'package:smart_soft/core/core_feature/data/repo/core_features_repo_impl.dart';
import 'package:smart_soft/core/core_feature/domain/repo/core_features_repo.dart';
import 'package:smart_soft/core/core_feature/domain/usecases/get_all_cities_use_case.dart';
import 'package:smart_soft/core/infrastructure/api/api.dart';
import 'package:smart_soft/core/infrastructure/services/image_picker_service.dart';
import 'package:smart_soft/core/utils/token_helper.dart';
import 'package:smart_soft/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:smart_soft/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:smart_soft/features/auth/data/repo/auth_repo_impl.dart';
import 'package:smart_soft/features/auth/domain/repo/auth_repo.dart';
import 'package:smart_soft/features/auth/domain/usecases/confirm_otp_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/delete_user_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/get_user_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/register_customer_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/register_seller_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/send_otp_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/login_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/set_user_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/update_user_use_case.dart';
import 'package:smart_soft/features/cart/data/data_source/remote/cart_remote_data_source.dart';
import 'package:smart_soft/features/cart/data/repo/cart_repo_impl.dart';
import 'package:smart_soft/features/cart/domain/repo/cart_repo.dart';
import 'package:smart_soft/features/cart/domain/usecase/add_to_cart_use_case.dart';
import 'package:smart_soft/features/cart/domain/usecase/get_cart_use_case.dart';
import 'package:smart_soft/features/cart/domain/usecase/remove_from_cart_use_case.dart';
import 'package:smart_soft/features/cart/domain/usecase/update_cart_item_use_case.dart';
import 'package:smart_soft/features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:smart_soft/features/home/data/repo/home_repo_impl.dart';
import 'package:smart_soft/features/home/domain/repo/home_repo.dart';
import 'package:smart_soft/features/home/domain/usecases/get_home_ads_use_case.dart';
import 'package:smart_soft/features/home/domain/usecases/set_home_ads_use_case.dart';
import 'package:smart_soft/features/order/data/data_source/remote/order_remote_data_source.dart';
import 'package:smart_soft/features/order/data/repo/order_repo_impl.dart';
import 'package:smart_soft/features/order/domain/repo/order_repo.dart';
import 'package:smart_soft/features/order/domain/usecases/create_order_use_case.dart';
import 'package:smart_soft/features/order/domain/usecases/get_order_use_case.dart';
import 'package:smart_soft/features/variation/data/data_source/remote/variation_remote_data_source.dart';
import 'package:smart_soft/features/variation/data/repo/variation_repo_impl.dart';
import 'package:smart_soft/features/variation/domain/repo/variation_repo.dart';
import 'package:smart_soft/features/variation/domain/usecases/get_all_sellers_use_case.dart';
import 'package:smart_soft/features/variation/domain/usecases/get_button_by_seller_id_use_case.dart';
import 'package:smart_soft/features/variation/domain/usecases/get_chest_by_seller_id_use_case.dart';
import 'package:smart_soft/features/variation/domain/usecases/get_collar_by_seller_id_use_case.dart';
import 'package:smart_soft/features/variation/domain/usecases/get_embroidery_by_seller_id_use_case.dart';
import 'package:smart_soft/features/variation/domain/usecases/get_fabric_by_seller_id_use_case.dart';
import 'package:smart_soft/features/variation/domain/usecases/get_front_pocket_by_seller_id_use_case.dart';
import 'package:smart_soft/features/variation/domain/usecases/get_sellers_by_location_id_use_case.dart';
import 'package:smart_soft/features/variation/domain/usecases/get_sleeve_by_seller_id_use_case.dart';
import '../../features/seller/add_variation/data/data_source/remote/seller_variation_remote_data_source.dart';
import '../../features/seller/add_variation/data/repo/seller_variation_repo_impl.dart';
import '../../features/seller/add_variation/domain/repo/seller_variation_repo.dart';
import '../../features/seller/add_variation/domain/usecase/create_button_use_case.dart';
import '../../features/seller/add_variation/domain/usecase/create_chest_use_case.dart';
import '../../features/seller/add_variation/domain/usecase/create_collar_use_case.dart';
import '../../features/seller/add_variation/domain/usecase/create_embroidery_use_case.dart';
import '../../features/seller/add_variation/domain/usecase/create_fabric_use_case.dart';
import '../../features/seller/add_variation/domain/usecase/create_front_pocket_use_case.dart';
import '../../features/seller/add_variation/domain/usecase/create_sleeve_use_case.dart';
import '../core_feature/domain/usecases/validate_password_use_case.dart';
import '../core_feature/domain/usecases/validate_phone_use_case.dart';
import '../core_feature/domain/usecases/validate_sizes_use_case.dart';
import '../core_feature/domain/usecases/validate_text_use_case.dart';
import '../core_feature/domain/usecases/validate_username_use_case.dart';
import '../infrastructure/services/network_service.dart';

final GetIt getIt = GetIt.instance;

abstract class AppModule {

  static void setup() {

    //services
    getIt.registerSingleton<NetworkService>(NetworkServiceImpl());
    getIt.registerSingleton<Api>(ApiImpl());
    getIt.registerSingleton<ImagePickerService>(ImagePickerServiceImpl());
    getIt.registerSingleton<TokenHelper>(TokenHelperImpl());

    //data source
    // ------ Auth ------
    getIt.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl());
    getIt.registerSingleton<AuthLocalDataSource>(AuthLocalDataSourceImpl());
    // ------ Variation ------
    getIt.registerSingleton<VariationRemoteDataSource>(VariationRemoteDataSourceImpl());
    // ------ Seller Variation ------
    getIt.registerSingleton<SellerVariationRemoteDataSource>(SellerVariationRemoteDataSourceImpl());
    // ------ Core Features ------
    getIt.registerSingleton<CoreFeaturesRemoteDataSource>(CoreFeaturesRemoteDataSourceImpl());
    // ------ Cart ------
    getIt.registerSingleton<CartRemoteDataSource>(CartRemoteDataSourceImpl());
    // ------ Home ------
    getIt.registerSingleton<HomeRemoteDataSource>(HomeRemoteDataSourceImpl());
    // ------ Order ------
    getIt.registerSingleton<OrderRemoteDataSource>(OrderRemoteDataSourceImpl());


    //repos
    // ------ Auth ------
    getIt.registerSingleton<AuthRepo>(AuthRepoImpl());
    // ------ Variation ------
    getIt.registerSingleton<VariationRepo>(VariationRepoImpl());
    // ------ Seller Variation ------
    getIt.registerSingleton<SellerVariationRepo>(SellerVariationRepoImpl());
    // ------ Core Features ------
    getIt.registerSingleton<CoreFeaturesRepo>(CoreFeaturesRepoImpl());
    // ------ Cart ------
    getIt.registerSingleton<CartRepo>(CartRepoImpl());
    // ------ Home ------
    getIt.registerSingleton<HomeRepo>(HomeRepoImpl());
    // ------ Order ------
    getIt.registerSingleton<OrderRepo>(OrderRepoImpl());


    //use case
    // ------ Auth ------
    getIt.registerSingleton<LoginUseCase>(LoginUseCase());
    getIt.registerSingleton<RegisterSellerUseCase>(RegisterSellerUseCase());
    getIt.registerSingleton<RegisterCustomerUseCase>(RegisterCustomerUseCase());
    getIt.registerSingleton<ResetPasswordUseCase>(ResetPasswordUseCase());
    getIt.registerSingleton<SendOtpUseCase>(SendOtpUseCase());
    getIt.registerSingleton<ConfirmOtpUseCase>(ConfirmOtpUseCase());

    // ----- User -----
    getIt.registerSingleton<GetUserUseCase>(GetUserUseCase());
    getIt.registerSingleton<SetUserUseCase>(SetUserUseCase());
    getIt.registerSingleton<DeleteUserUseCase>(DeleteUserUseCase());
    getIt.registerSingleton<UpdateUserUseCase>(UpdateUserUseCase());

    // ----- Get Seller -----
    getIt.registerSingleton<GetAllSellersUseCase>(GetAllSellersUseCase());
    getIt.registerSingleton<GetSellersByLocationIdUseCase>(GetSellersByLocationIdUseCase());

    // ----- Variation -----
    getIt.registerSingleton<GetFabricBySellerIdUseCase>(GetFabricBySellerIdUseCase());
    getIt.registerSingleton<GetCollarBySellerIdUseCase>(GetCollarBySellerIdUseCase());
    getIt.registerSingleton<GetChestBySellerIdUseCase>(GetChestBySellerIdUseCase());
    getIt.registerSingleton<GetFrontPocketBySellerIdUseCase>(GetFrontPocketBySellerIdUseCase());
    getIt.registerSingleton<GetSleeveBySellerIdUseCase>(GetSleeveBySellerIdUseCase());
    getIt.registerSingleton<GetButtonBySellerIdUseCase>(GetButtonBySellerIdUseCase());
    getIt.registerSingleton<GetEmbroideryBySellerIdUseCase>(GetEmbroideryBySellerIdUseCase());

    // ----- Create Variation -----
    getIt.registerSingleton<CreateButtonUseCase>(CreateButtonUseCase());
    getIt.registerSingleton<CreateChestUseCase>(CreateChestUseCase());
    getIt.registerSingleton<CreateCollarUseCase>(CreateCollarUseCase());
    getIt.registerSingleton<CreateEmbroideryUseCase>(CreateEmbroideryUseCase());
    getIt.registerSingleton<CreateFabricUseCase>(CreateFabricUseCase());
    getIt.registerSingleton<CreateFrontPocketUseCase>(CreateFrontPocketUseCase());
    getIt.registerSingleton<CreateSleeveUseCase>(CreateSleeveUseCase());

    // ------ Cart ------
    getIt.registerSingleton<GetCartUseCase>(GetCartUseCase());
    getIt.registerSingleton<RemoveFromCartUseCase>(RemoveFromCartUseCase());
    getIt.registerSingleton<UpdateCartItemUseCase>(UpdateCartItemUseCase());
    getIt.registerSingleton<AddToCartUseCase>(AddToCartUseCase());

    // ------ Home ------
    getIt.registerSingleton<GetHomeAdsUseCase>(GetHomeAdsUseCase());
    getIt.registerSingleton<SetHomeAdsUseCase>(SetHomeAdsUseCase());

    // ------ Order ------
    getIt.registerSingleton<CreateOrderUseCase>(CreateOrderUseCase());
    getIt.registerSingleton<GetOrderUseCase>(GetOrderUseCase());


    // ------ Core Features ------
    getIt.registerSingleton<GetAllCitiesUseCase>(GetAllCitiesUseCase());

    // ----- Validation -----
    getIt.registerSingleton<ValidatePhoneUseCase>(ValidatePhoneUseCase());
    getIt.registerSingleton<ValidatePasswordUseCase>(ValidatePasswordUseCase());
    getIt.registerSingleton<ValidateUsernameUseCase>(ValidateUsernameUseCase());
    getIt.registerSingleton<ValidateTextUseCase>(ValidateTextUseCase());
    getIt.registerSingleton<ValidateSizesUseCase>(ValidateSizesUseCase());

  }


}

