import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/cart/data/entities/cart_response.dart';
import 'package:smart_soft/features/cart/domain/repo/cart_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../../auth/domain/usecases/get_user_use_case.dart';

class RemoveFromCartUseCase {

  CartRepo repo = getIt<CartRepo>();

  Future<Either<Failure, CartResponse>> call({required String cartItemId}) async {

    return getIt<GetUserUseCase>().call().then(
            (value) =>
            value.fold(
                    (userError) {
                  return left(userError);
                },
                    (userSuccess) async {
                  if (userSuccess.token != null) {
                    return await repo.removeFromCart(token: userSuccess.token!, cartItemId: cartItemId);
                  }
                  return left(InternalFailure(
                      "token is equal to null", failureCode: 3
                  ));
                }

            ));

  }

}