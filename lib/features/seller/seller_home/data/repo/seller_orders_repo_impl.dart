import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_soft/core/errors/failure.dart';
import 'package:smart_soft/features/seller/seller_home/data/entities/get_one_seller_response.dart';
import 'package:smart_soft/features/seller/seller_home/data/entities/profile_response.dart';

import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../../core/infrastructure/services/network_service.dart';
import '../../data/entities/get_seller_orders_reponse.dart';
import '../../data/entities/mark_seller_order_response.dart';
import '../../domain/repo/seller_orders_repo.dart';
import '../data_source/remote/seller_orders_remote_data_source.dart';

class SellerOrdersRepoImpl implements SellerOrdersRepo {

  SellerOrdersRemoteDataSource remoteDataSource = getIt<SellerOrdersRemoteDataSource>();
  NetworkService networkService = getIt<NetworkService>();

  Future<Either<Failure,GetSellerOrdersResponse>> getSellerOrders({required String token,required int orderStatues}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      final getSellerOrdersResponse = await remoteDataSource.getSellerOrders(token: token, orderStatues: orderStatues);

      if (getSellerOrdersResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            getSellerOrdersResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(getSellerOrdersResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  Future<Either<Failure,MarkSellerOrderResponse>> markSellerOrder({required String token,required int orderId}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      final markSellerOrderResponse = await remoteDataSource.markSellerOrder(token: token, orderId: orderId);

      if (markSellerOrderResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            markSellerOrderResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(markSellerOrderResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, GetOneSellerResponse>> getSeller({required int id}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      final response = await remoteDataSource.getSeller(id: id);

      if (response.isSuccssed == false) {
        return left(RemoteDataFailure(
            response.message.toString(),
            failureCode: 1
        ));
      }

      return right(response);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, ProfileResponse>> updateSellerDetails({required String token, required String username}) async  {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      final response = await remoteDataSource.updateSellerDetails(token: token, username: username);

      if (response.isSuccssed == false) {
        return left(RemoteDataFailure(
            response.message.toString(),
            failureCode: 1
        ));
      }

      return right(response);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, ProfileResponse>> uploadSellerImageDetails({required String token, required XFile image}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      final response = await remoteDataSource.uploadSellerImageDetails(token: token, image: image);

      if (response.isSuccssed == false) {
        return left(RemoteDataFailure(
            response.message.toString(),
            failureCode: 1
        ));
      }

      return right(response);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

}