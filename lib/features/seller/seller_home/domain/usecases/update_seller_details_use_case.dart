import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/auth/domain/usecases/get_user_use_case.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/entities/get_one_seller_response.dart';
import '../../data/entities/get_seller_orders_reponse.dart';
import '../../data/entities/profile_response.dart';
import '../repo/seller_orders_repo.dart';

class UpdateSellerDetailsUseCase {

  SellerOrdersRepo repo = getIt<SellerOrdersRepo>();

  Future<Either<Failure, ProfileResponse>> call({required String username}) async {

    return getIt<GetUserUseCase>().call().then(
            (value) => value.fold(
                    (error) {
                      return left(error);
                    },
                    (success) async {

                      if(success.token == null){
                        return left(Failure("Please login first to access all features in the application", failureCode: 0));

                      } else {

                        return await repo.updateSellerDetails(token: success.token!, username: username);

                      }
                    }
            )
    );
  }

}