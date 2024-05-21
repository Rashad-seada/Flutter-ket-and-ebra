import 'package:dartz/dartz.dart';
import 'package:smart_soft/features/seller/seller_variations/domain/repo/seller_variant_repo.dart';

import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../auth/domain/usecases/get_user_use_case.dart';
import '../../data/entities/seller_variants_response.dart';

class GetSellerVariantUseCase {

  SellerVariantRepo repo = getIt<SellerVariantRepo>();

  Future<Either<Failure, SellerVariantsResponse>> call({ required int variantNumber}) async {

    return getIt<GetUserUseCase>().call().then((value) => value.fold(
            (error) {
          return left(error);
        },
            (user) async {
          if(user.token != null) {
            return await repo.getSellerVariants(token: user.token! , variantNumber: variantNumber);

          }
          return left(
              Failure("You have to login and try again", failureCode: 0)
          );

        }
    ));
  }

}