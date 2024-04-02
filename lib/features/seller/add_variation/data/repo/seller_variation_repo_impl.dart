
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import 'package:smart_soft/core/errors/failure.dart';

import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../../core/infrastructure/services/network_service.dart';
import '../../domain/repo/seller_variation_repo.dart';
import '../data_source/remote/seller_variation_remote_data_source.dart';
import '../entities/create_variation_response.dart';

class SellerVariationRepoImpl implements SellerVariationRepo {

  SellerVariationRemoteDataSource remoteDataSource = getIt<SellerVariationRemoteDataSource>();
  NetworkService networkService = getIt<NetworkService>();


  @override
  Future<Either<Failure, CreateVariationResponse>> createButton({required String token, required String title, required String description,required double price,required XFile? image}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      CreateVariationResponse createResponse = await remoteDataSource.createButton(token: token, title: title, description: description,price: price, image: image);

      if (createResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            createResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(createResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, CreateVariationResponse>> createChest({required String token, required String title, required String description,required XFile? image}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      CreateVariationResponse createResponse = await remoteDataSource.createChest(token: token, title: title, description: description, image: image);

      if (createResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            createResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(createResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, CreateVariationResponse>> createCollar({required String token, required String title, required String description,required XFile? image}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      CreateVariationResponse createResponse = await remoteDataSource.createCollar(token: token, title: title, description: description, image: image);

      if (createResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            createResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(createResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, CreateVariationResponse>> createEmbroidery({required String token, required String title, required String description,required double price,required XFile? image}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      CreateVariationResponse createResponse = await remoteDataSource.createEmbroidery(token: token, title: title, description: description,price: price, image: image);

      if (createResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            createResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(createResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, CreateVariationResponse>> createFabric({required String token, required String title, required String description, required double price,required XFile? image}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      CreateVariationResponse createResponse = await remoteDataSource.createFabric(token: token, title: title, description: description,price: price, image: image);

      if (createResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            createResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(createResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, CreateVariationResponse>> createFrontPocket({required String token, required String title, required String description,required XFile? image}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      CreateVariationResponse createResponse = await remoteDataSource.createFrontPocket(token: token, title: title, description: description, image: image);

      if (createResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            createResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(createResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, CreateVariationResponse>> createSleeve({required String token, required String title, required String description,required XFile? image}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      CreateVariationResponse createResponse = await remoteDataSource.createSleeve(token: token, title: title, description: description, image: image);

      if (createResponse.isSuccssed == false) {
        return left(RemoteDataFailure(
            createResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(createResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }
}