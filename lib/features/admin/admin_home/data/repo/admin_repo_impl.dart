import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_soft/core/errors/failure.dart';
import 'package:smart_soft/features/admin/admin_home/data/data_source/remote/admin_remote_data_source.dart';
import 'package:smart_soft/features/admin/admin_home/data/entities/approve_seller_response.dart';
import 'package:smart_soft/features/admin/admin_home/data/entities/get_admin_home_response.dart';
import 'package:smart_soft/features/admin/admin_home/data/entities/get_home_ads_by_admin_response.dart';
import 'package:smart_soft/features/admin/admin_home/data/entities/get_rejected_sellers_response.dart';
import 'package:smart_soft/features/admin/admin_home/domain/repo/admin_repo.dart';

import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../../core/infrastructure/services/network_service.dart';

class AdminRepoImpl implements AdminRepo {

  NetworkService networkService = getIt<NetworkService>();
  AdminRemoteDataSource remoteDataSource = getIt<AdminRemoteDataSource>();

  @override
  Future<Either<Failure, ApprovedSellerResponse>> approvedSeller({required String token, required bool isApproved, required int sellerId}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      final response = await remoteDataSource.approvedSeller(token: token, isApproved: isApproved, sellerId: sellerId);

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
  Future<Either<Failure, ApprovedSellerResponse>> deleteHomeAdsByAdmin({required String token, required int adId}) async  {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      final response = await remoteDataSource.deleteHomeAdsByAdmin(token: token, adId: adId);

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
  Future<Either<Failure, GetAdminHomeResponse>> getAdminHome({required String token}) async  {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      final response = await remoteDataSource.getAdminHome(token: token);

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
  Future<Either<Failure, GetHomeAdsByAdminResponse>> getHomeAdsByAdmin({required String token}) async  {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      final response = await remoteDataSource.getHomeAdsByAdmin(token: token);

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
  Future<Either<Failure, GetRejectedSellersResponse>> getRejectedSellers({required String token}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      final response = await remoteDataSource.getRejectedSellers(token: token);

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
  Future<Either<Failure, ApprovedSellerResponse>> setHomeAdsByAdmin({required String token, int? sellerId, required XFile image, required String description}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }


      final response = await remoteDataSource.setHomeAdsByAdmin(token: token, image: image, description: description,sellerId: sellerId);

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