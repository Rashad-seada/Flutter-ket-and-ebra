import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/errors/failure.dart';

import '../../data/entities/create_order_response.dart';
import '../../data/entities/get_all_orders_response.dart';

abstract class OrderRepo {

  Future<Either<Failure,CreateOrderResponse>> createOrder({required String token,required String username,required String phoneNumber, required int locationId,});

  Future<Either<Failure,GetAllOrdersResponse>> getUserOrder({
    required String token,
  });

}