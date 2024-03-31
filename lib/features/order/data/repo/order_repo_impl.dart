import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/errors/failure.dart';
import 'package:smart_soft/features/order/data/data_source/remote/order_remote_data_source.dart';
import 'package:smart_soft/features/order/data/entities/create_order_response.dart';
import 'package:smart_soft/features/order/domain/repo/order_repo.dart';

import '../../../../core/di/app_module.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/infrastructure/services/network_service.dart';
import '../entities/get_all_orders_response.dart';

class OrderRepoImpl implements OrderRepo {

  NetworkService networkService = getIt<NetworkService>();
  OrderRemoteDataSource remoteDataSource = getIt<OrderRemoteDataSource>();

  @override
  Future<Either<Failure, CreateOrderResponse>> createOrder({required String token, required String username, required String phoneNumber, required int locationId}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      final orderResponse = await remoteDataSource.createOrder(token: token, username: username, phoneNumber: phoneNumber, locationId: locationId);

      if (orderResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            orderResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(orderResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, GetAllOrdersResponse>> getUserOrder({required String token}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      final orderResponse = await remoteDataSource.getUserOrder(token: token);

      if (orderResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            orderResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(orderResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }
}