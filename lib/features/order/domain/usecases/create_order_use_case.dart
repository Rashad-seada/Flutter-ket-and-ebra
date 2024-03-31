import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/core/utils/token_helper.dart';
import 'package:smart_soft/features/auth/data/entities/login_response.dart';
import 'package:smart_soft/features/auth/domain/repo/auth_repo.dart';
import 'package:smart_soft/features/auth/domain/usecases/get_user_use_case.dart';
import 'package:smart_soft/features/cart/data/entities/cart_response.dart';
import 'package:smart_soft/features/cart/domain/repo/cart_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../data/entities/create_order_response.dart';
import '../repo/order_repo.dart';

class CreateOrderUseCase {

  OrderRepo repo = getIt<OrderRepo>();

  Future<Either<Failure, CreateOrderResponse>> call({required String username, required String phoneNumber, required int locationId, }) async {
    return getIt<GetUserUseCase>().call().then(
            (value) =>
            value.fold(
                    (userError) {
                  return left(userError);
                },
                    (userSuccess) async {
                  if (userSuccess.token != null) {
                    return await repo.createOrder(token: userSuccess.token! , username: username, phoneNumber: phoneNumber, locationId: locationId);
                  }
                  return left(InternalFailure(
                      "token is equal to null", failureCode: 3));
                }

            ));
  }
}