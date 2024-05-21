
import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/errors/failure.dart';
import 'package:smart_soft/features/cart/data/data_source/remote/cart_remote_data_source.dart';
import 'package:smart_soft/features/cart/data/entities/cart_response.dart';
import 'package:smart_soft/features/cart/domain/repo/cart_repo.dart';

import '../../../../core/di/app_module.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/infrastructure/services/network_service.dart';

class CartRepoImpl implements CartRepo {

  NetworkService networkService = getIt<NetworkService>();
  CartRemoteDataSource remoteDataSource = getIt<CartRemoteDataSource>();


  @override
  Future<Either<Failure, CartResponse>> addToCart({required String token, required String sellerId, required String length, required String shoulder, required String sleeves, required String chest, required String neck, required String hand, required String cuff, required String fabricId, required String collarId, required String chestId, required String frontPocketId, required String sleeveId, required String buttonId, required String embroideryId}) async {
    try{

    if(!await networkService.isConnected){
    return left(ServiceFailure(
    "Please check your internet connection",
    failureCode: 0
    ));
    }

    final cartEntity = await remoteDataSource.addToCart(token: token, sellerId: sellerId, length: length, shoulder: shoulder, sleeves: sleeves, chest: chest, neck: neck, hand: hand, cuff: cuff, fabricId: fabricId, collarId: collarId, chestId: chestId, frontPocketId: frontPocketId, sleeveId: sleeveId, buttonId: buttonId, embroideryId: embroideryId);
    if(cartEntity.isSuccssed != true){
      return left(ServiceFailure(
          cartEntity.message.toString(),
          failureCode: 0
      ));
    }
    return right(cartEntity);

    }on RemoteDataException catch (e){
    return left(RemoteDataFailure(e.message, failureCode: 1));

    } on ServiceException catch (e){
    return left(ServiceFailure(e.message,failureCode: 2));

    } catch (e) {
    return left(InternalFailure(e.toString(),failureCode: 3));
    }
  }

  @override
  Future<Either<Failure, CartResponse>> getCart(String token) async  {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      final cartEntity = await remoteDataSource.getCart(token);
      if(cartEntity.isSuccssed != true){
        return left(ServiceFailure(
            cartEntity.message.toString(),
            failureCode: 0
        ));
      }
      return right(cartEntity);

    }on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 1));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 2));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 3));
    }
  }

  @override
  Future<Either<Failure, CartResponse>> removeFromCart({required String token, required String cartItemId}) async  {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      final cartEntity = await remoteDataSource.removeFromCart(token: token, cartItemId: cartItemId);

      if(cartEntity.isSuccssed != true){
        return left(ServiceFailure(
            cartEntity.message.toString(),
            failureCode: 0
        ));
      }

      return right(cartEntity);

    }on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 1));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 2));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 3));
    }
  }

  @override
  Future<Either<Failure, CartResponse>> updateCartItem({required String token, required String cartItemId, required String length, required String shoulder, required String sleeves, required String chest, required String neck, required String hand, required String cuff, required String fabricId, required String collarId, required String chestId, required String frontPocketId, required String sleeveId, required String buttonId, required String embroideryId}) async  {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      final cartEntity = await remoteDataSource.removeFromCart(token: token, cartItemId: cartItemId);
      if(cartEntity.isSuccssed != true){
        return left(ServiceFailure(
            cartEntity.message.toString(),
            failureCode: 0
        ));
      }
      return right(cartEntity);

    }on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 1));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 2));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 3));
    }
  }
}